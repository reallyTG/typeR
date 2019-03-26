library(rcoreoa)


### Name: core_advanced_search
### Title: Advanced Search CORE
### Aliases: core_advanced_search core_advanced_search_

### ** Examples

## Not run: 
##D query <- data.frame(
##D "all_of_the_words" = c("data mining", "machine learning"),
##D "without_the_words" = c("social science", "medicine"),
##D "year_from" = c("2013","2000"),
##D "year_to" = c("2014", "2016"))
##D 
##D res <- core_advanced_search(query)
##D head(res$data)
##D res$data[[1]]$id
## End(Not run)



