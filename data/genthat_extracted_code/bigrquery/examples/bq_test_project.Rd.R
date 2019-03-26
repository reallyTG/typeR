library(bigrquery)


### Name: bq_test_project
### Title: Project to use for testing bigrquery
### Aliases: bq_test_project bq_test_init bq_test_dataset bq_testable
###   bq_authable gs_test_bucket gs_test_object
### Keywords: internal

### ** Examples

if (bq_testable()) {
  ds <- bq_test_dataset()
  bq_mtcars <- bq_table_upload(bq_table(ds, "mtcars"), mtcars)

  # dataset and table will be automatically deleted when ds is GC'd
}



