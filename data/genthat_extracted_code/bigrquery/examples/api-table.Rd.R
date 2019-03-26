library(bigrquery)


### Name: api-table
### Title: BigQuery tables
### Aliases: api-table bq_table_create bq_table_meta bq_table_fields
###   bq_table_size bq_table_nrow bq_table_exists bq_table_delete
###   bq_table_copy bq_table_upload bq_table_save bq_table_load

### ** Examples

if (bq_testable()) {
ds <- bq_test_dataset()

bq_mtcars <- bq_table(ds, "mtcars")
bq_table_exists(bq_mtcars)

bq_table_upload(bq_mtcars, mtcars)
bq_table_exists(bq_mtcars)

bq_table_fields(bq_mtcars)
bq_table_size(bq_mtcars)
str(bq_table_meta(bq_mtcars))

bq_table_delete(bq_mtcars)
bq_table_exists(bq_mtcars)

my_natality <- bq_table(ds, "mynatality")
bq_table_copy("publicdata.samples.natality", my_natality)
}



