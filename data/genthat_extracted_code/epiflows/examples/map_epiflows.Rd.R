library(epiflows)


### Name: map_epiflows
### Title: Map flows of people between locations
### Aliases: map_epiflows

### ** Examples

data("Brazil_epiflows")
data("YF_coordinates")
ef <- add_coordinates(Brazil_epiflows, YF_coordinates[-1])
plot(ef)
map_epiflows(ef, center = "Espirito Santo", title = "Flows to and from Brazil")



