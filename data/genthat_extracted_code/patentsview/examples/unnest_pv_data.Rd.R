library(patentsview)


### Name: unnest_pv_data
### Title: Unnest PatentsView data
### Aliases: unnest_pv_data

### ** Examples

## Not run: 
##D 
##D fields <- c("patent_id", "patent_title", "inventor_city", "inventor_country")
##D res <- search_pv(query = '{"_gte":{"patent_year":2015}}', fields = fields)
##D unnest_pv_data(data = res$data, pk = "patent_id")
## End(Not run)




