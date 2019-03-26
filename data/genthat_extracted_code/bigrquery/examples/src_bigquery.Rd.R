library(bigrquery)


### Name: src_bigquery
### Title: A BigQuery data source for dplyr.
### Aliases: src_bigquery

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D # To run this example, replace billing with the id of one of your projects
##D # set up for billing
##D con <- DBI::dbConnect(bigquery(), project = bq_test_project())
##D 
##D shakespeare <- con %>% tbl("publicdata.samples.shakespeare")
##D shakespeare
##D shakespeare %>%
##D   group_by(word) %>%
##D   summarise(n = sum(word_count, na.rm = TRUE)) %>%
##D   arrange(desc(n))
## End(Not run)



