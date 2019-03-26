library(soql)


### Name: soql_simple_filter
### Title: Create a simple equality filter
### Aliases: soql_simple_filter

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_simple_filter("height", 50) %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_simple_filter(soql_chain, "height", 50)
  my_url <- as.character(soql_chain)
}



