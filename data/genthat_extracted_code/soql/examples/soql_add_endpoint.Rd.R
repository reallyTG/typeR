library(soql)


### Name: soql_add_endpoint
### Title: Add SODA API endpoint
### Aliases: soql_add_endpoint

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_add_endpoint("https://fake.soda.api/resource.json") %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_add_endpoint(soql_chain, "https://fake.soda.api/resource.json")
  my_url <- as.character(soql_chain)
}



