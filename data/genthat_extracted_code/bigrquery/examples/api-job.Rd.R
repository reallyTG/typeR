library(bigrquery)


### Name: api-job
### Title: BigQuery job: retrieve metadata
### Aliases: api-job api-job bq_job_meta api-job bq_job_status api-job
###   bq_job_show_statistics api-job bq_job_wait

### ** Examples

if (bq_testable()) {
jobs <- bq_project_jobs(bq_test_project())
jobs[[1]]

# Show statistics about job
bq_job_show_statistics(jobs[[1]])

# Wait for job to complete
bq_job_wait(jobs[[1]])
}



