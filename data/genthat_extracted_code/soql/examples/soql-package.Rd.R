library(soql)


### Name: soql-package
### Title: Helps Make Socrata Open Data API Calls
### Aliases: soql-package
### Keywords: package

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_where("height > 30") %>%
    soql_limit(20) %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_where(soql_chain, "height > 30")
  soql_chain <- soql_limit(20)
  my_url <- as.character(soql_chain)
}



