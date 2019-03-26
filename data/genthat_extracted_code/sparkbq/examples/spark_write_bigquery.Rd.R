library(sparkbq)


### Name: spark_write_bigquery
### Title: Writing data to Google BigQuery
### Aliases: spark_write_bigquery
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
##D # Copy mtcars to Spark
##D spark_mtcars <- dplyr::copy_to(sc, mtcars, "spark_mtcars", overwrite = TRUE)
##D 
##D spark_write_bigquery(
##D   data = spark_mtcars,
##D   datasetId = "<your_dataset_id>",
##D   tableId = "mtcars",
##D   mode = "overwrite")
## End(Not run)



