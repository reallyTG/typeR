library(soql)


### Name: soql_offset
### Title: Control which records you receive from a SODA API
### Aliases: soql_offset

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_offset(50) %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_offset(soql_chain, 50)
  my_url <- as.character(soql_chain)
}



