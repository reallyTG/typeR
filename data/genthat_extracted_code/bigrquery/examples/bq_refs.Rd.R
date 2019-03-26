library(bigrquery)


### Name: bq_refs
### Title: S3 classes that reference remote BigQuery datasets, tables and
###   jobs
### Aliases: bq_dataset as_bq_dataset bq_table as_bq_table bq_job as_bq_job

### ** Examples

# Creation ------------------------------------------------
samples <- bq_dataset("publicdata", "samples")
natality <- bq_table("publicdata", "samples", "natality")
natality

# Or
bq_table(samples, "natality")

bq_job("bigrquery-examples", "m0SgFu2ycbbge6jgcvzvflBJ_Wft")

# Coercion ------------------------------------------------
as_bq_dataset("publicdata.shakespeare")
as_bq_table("publicdata.samples.natality")

as_bq_table(list(
  project_id = "publicdata",
  dataset_id = "samples",
  table_id = "natality"
))

as_bq_job(list(
  projectId = "bigrquery-examples",
  jobId = "US.job_m0SgFu2ycbbge6jgcvzvflBJ_Wft"
))




