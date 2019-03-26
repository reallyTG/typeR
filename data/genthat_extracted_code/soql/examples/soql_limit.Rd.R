library(soql)


### Name: soql_limit
### Title: Limit the number of results from a SODA response
### Aliases: soql_limit

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_limit(5) %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_limit(soql_chain, 5)
  my_url <- as.character(soql_chain)
}



