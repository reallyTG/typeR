library(soql)


### Name: soql_queries
### Title: SoQL Queries
### Aliases: soql_queries soql_select soql_where soql_order soql_group
###   soql_q

### ** Examples

if (require(magrittr)) {
  # With pipes
  my_url <- soql() %>%
    soql_select("height,weight") %>%
    soql_where("height > 30") %>%
    soql_order("height", desc=TRUE) %>%
    soql_group("type") %>%
    soql_q("a") %>%
    as.character()
} else {
  # Without pipes
  soql_chain <- soql()
  soql_chain <- soql_select(soql_chain, "height,weight")
  soql_chain <- soql_where(soql_chain, "height > 30")
  soql_chain <- soql_order(soql_chain, "height", desc=TRUE)
  soql_chain <- soql_group(soql_chain, "type")
  soql_chain <- soql_q(soql_chain, "a")
  my_url <- as.character(soql_chain)
}



