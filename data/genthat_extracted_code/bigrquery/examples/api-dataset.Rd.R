library(bigrquery)


### Name: api-dataset
### Title: BigQuery datasets
### Aliases: api-dataset bq_dataset_create bq_dataset_meta
###   bq_dataset_exists bq_dataset_update bq_dataset_delete
###   bq_dataset_tables

### ** Examples

if (bq_testable()) {
ds <- bq_dataset(bq_test_project(), "dataset_api")
bq_dataset_exists(ds)

bq_dataset_create(ds)
bq_dataset_exists(ds)
str(bq_dataset_meta(ds))

bq_dataset_delete(ds)
bq_dataset_exists(ds)

# Use bq_test_dataset() to create a temporary dataset that will
# be automatically deleted
ds <- bq_test_dataset()
bq_table_create(bq_table(ds, "x1"))
bq_table_create(bq_table(ds, "x2"))
bq_table_create(bq_table(ds, "x3"))
bq_dataset_tables(ds)
}



