
ALTER TABLE dw_stage.mktg_dianomi_ad_perf_variant_actns_s
add links_tx varchar(2000);

DROP TABLE IF EXISTS dw_stage.mktg_dianomi_ad_perf_variant_actns_w ;

CREATE TABLE dw_stage.mktg_dianomi_ad_perf_variant_actns_w
(
   campaign_domain_id  varchar(100),
   campaign_type_id    varchar(100),
   vertical_id         varchar(100),
   src_sys_id          integer,
   dw_variant_perf_sk  bigint,
   ext_customer_id     bigint,
   acct_desc_nm        varchar(1000),
   dw_eff_dt           date,
   campaign_id         varchar(100),
   campaign_nm         varchar(2000),
   variant_id          bigint,
   image_and_text_tx   varchar(2000),
   curr_status_cd      varchar(100),
   imprsn_ct           bigint,
   click_ct            bigint,
   scr_nr              numeric(23,2),
   valid_actn_ct       bigint,
   cost_am             numeric(23,2),
   cost_per_actn_rate  numeric(23,2),
   links_tx            varchar(2000),
   dw_load_ts          timestamp
)
DISTSTYLE KEY
DISTKEY ("campaign_id")
SORTKEY ("dw_eff_dt");

GRANT REFERENCES,   TRIGGER, DELETE, RULE, INSERT, UPDATE, SELECT ON dw_stage.mktg_dianomi_ad_perf_variant_actns_w TO group grp_etl;
GRANT RULE, DELETE, TRIGGER, SELECT, INSERT,   REFERENCES, UPDATE ON dw_stage.mktg_dianomi_ad_perf_variant_actns_w TO nw_dwh_etl;
GRANT DELETE, UPDATE, SELECT,   TRIGGER ON dw_stage.mktg_dianomi_ad_perf_variant_actns_w TO group grp_ba_users;
GRANT SELECT,   TRIGGER, DELETE, UPDATE ON dw_stage.mktg_dianomi_ad_perf_variant_actns_w TO group grp_data_users;

create table dw_workarea.mktg_dianomi_ad_perf_variant_actns_f as (select * from dw_report.mktg_dianomi_ad_perf_variant_actns_f);
DROP TABLE IF EXISTS dw_report.mktg_dianomi_ad_perf_variant_actns_f ;

CREATE TABLE dw_report.mktg_dianomi_ad_perf_variant_actns_f
(
   campaign_domain_id  varchar(100),
   campaign_type_id    varchar(100),
   vertical_id         varchar(100),
   src_sys_id          integer,
   dw_variant_perf_sk  bigint,
   ext_customer_id     bigint,
   acct_desc_nm        varchar(1000),
   dw_eff_dt           date,
   campaign_id         varchar(100),
   campaign_nm         varchar(2000),
   variant_id          bigint,
   image_and_text_tx   varchar(2000),
   curr_status_cd      varchar(100),
   imprsn_ct           bigint,
   click_ct            bigint,
   scr_nr              numeric(23,2),
   valid_actn_ct       bigint,
   cost_am             numeric(23,2),
   cost_per_actn_rate  numeric(23,2),
   links_tx            varchar(2000),
   dw_load_ts          timestamp
)
DISTSTYLE KEY
DISTKEY ("campaign_id")
SORTKEY ("dw_eff_dt");
GRANT UPDATE, TRIGGER, SELECT,  DELETE ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_power_users;
GRANT   RULE, SELECT, REFERENCES, TRIGGER, DELETE, INSERT, UPDATE ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_etl;
GRANT UPDATE, DELETE,   TRIGGER, SELECT ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_nw_fin_data_users;
GRANT TRIGGER, SELECT, REFERENCES, UPDATE, RULE, DELETE, INSERT ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO nw_dwh_etl;
GRANT TRIGGER, SELECT, UPDATE,   DELETE ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_bi_tool_users;
GRANT UPDATE, TRIGGER,   DELETE, SELECT ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO app_redash_beta;
GRANT SELECT,   UPDATE, TRIGGER, DELETE ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_redash;
GRANT REFERENCES,   TRIGGER, INSERT, DELETE, UPDATE, RULE, SELECT ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_ba_users;
GRANT   UPDATE, SELECT, TRIGGER, DELETE ON dw_report.mktg_dianomi_ad_perf_variant_actns_f TO group grp_data_users;


INSERT INTO dw_report.mktg_dianomi_ad_perf_variant_actns_f
(
campaign_domain_id
,campaign_type_id
,vertical_id
,src_sys_id
,dw_variant_perf_sk
,ext_customer_id
,acct_desc_nm
,dw_eff_dt
,campaign_id
,campaign_nm
,variant_id
,image_and_text_tx
,curr_status_cd
,imprsn_ct
,click_ct
,scr_nr
,valid_actn_ct
,cost_am
,cost_per_actn_rate
,links_tx
,dw_load_ts
)
SELECT
stg.campaign_domain_id
,stg.campaign_type_id
,stg.vertical_id
,stg.src_sys_id
,stg.dw_variant_perf_sk
,stg.ext_customer_id
,stg.acct_desc_nm
,stg.dw_eff_dt
,stg.campaign_id
,stg.campaign_nm
,stg.variant_id
,stg.image_and_text_tx
,stg.curr_status_cd
,stg.imprsn_ct
,stg.click_ct
,stg.scr_nr
,stg.valid_actn_ct
,stg.cost_am
,stg.cost_per_actn_rate
,NULL as links_tx
,stg.dw_load_ts
FROM
dw_workarea.mktg_dianomi_ad_perf_variant_actns_f stg;





