library(sparkbq)


### Name: spark_read_bigquery
### Title: Reading data from Google BigQuery
### Aliases: spark_read_bigquery
### Keywords: connection database,

### ** Examples

## Not run: 
##D config <- spark_config()
##D 
##D sc <- spark_connect(master = "local", config = config)
##D 
##D bigquery_defaults(
##D   billingProjectId = "<your_billing_project_id>",
##D   gcsBucket = "<your_gcs_bucket>",
##D   datasetLocation = "US",
##D   serviceAccountKeyFile = "<your_service_account_key_file>",
##D   type = "direct")
##D 
##D # Reading the public shakespeare data table
##D # https://cloud.google.com/bigquery/public-data/
##D # https://cloud.google.com/bigquery/sample-tables
##D shakespeare <-
##D   spark_read_bigquery(
##D     sc,
##D     name = "shakespeare",
##D     projectId = "bigquery-public-data",
##D     datasetId = "samples",
##D     tableId = "shakespeare")
## End(Not run)



