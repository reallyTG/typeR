library(bigrquery)


### Name: api-project
### Title: BigQuery project methods
### Aliases: api-project bq_project_datasets bq_project_jobs

### ** Examples

if (bq_authable()) {
bq_project_datasets("bigquery-public-data")
bq_project_datasets("githubarchive")
}

if (bq_testable()) {
bq_project_jobs(bq_test_project(), page_size = 10)
}



