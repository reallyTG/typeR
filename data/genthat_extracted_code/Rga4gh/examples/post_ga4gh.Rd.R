library(Rga4gh)


### Name: post_ga4gh
### Title: POST to a GA4GH Server
### Aliases: post_ga4gh

### ** Examples

## Create a client
ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "", log_level = 1)

## A request body as a list
body_list <- list(pageSize = 2)

## Not run: 
##D ## Post to the /datasets/search operation
##D datasets_list <- ref_client %>% post_ga4gh("/datasets/search", body_list) %>% content
##D datasets_list
##D 
## End(Not run)




