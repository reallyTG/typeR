library(epiflows)


### Name: get_flows
### Title: Access flow data
### Aliases: get_flows get_flows.epiflows

### ** Examples

data("Brazil_epiflows")
head(get_flows(Brazil_epiflows))
get_flows(Brazil_epiflows, from = "Minas Gerais")
get_flows(Brazil_epiflows, to = "Minas Gerais")
get_flows(Brazil_epiflows, from = "Italy", to = "Minas Gerais")



