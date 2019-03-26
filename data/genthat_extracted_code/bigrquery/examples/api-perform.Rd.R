library(bigrquery)


### Name: api-perform
### Title: BigQuery jobs: perform a job
### Aliases: api-perform api-perform bq_perform_extract api-perform
###   bq_perform_upload api-perform bq_perform_load bq_perform_query
###   bq_perform_copy
### Keywords: internal

### ** Examples

if (bq_testable()) {
ds <- bq_test_dataset()
bq_mtcars <- bq_table(ds, "mtcars")
job <- bq_perform_upload(bq_mtcars, mtcars)
bq_table_exists(bq_mtcars)

bq_job_wait(job)
bq_table_exists(bq_mtcars)
head(bq_table_download(bq_mtcars))
}



