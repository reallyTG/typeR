library(bigrquery)


### Name: bq_table_download
### Title: Download table data
### Aliases: bq_table_download

### ** Examples

if (bq_testable()) {
df <- bq_table_download("publicdata.samples.natality", max_results = 35000)
}



