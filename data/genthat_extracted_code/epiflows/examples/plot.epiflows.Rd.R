library(epiflows)


### Name: plot.epiflows
### Title: Various plots for epiflows objects
### Aliases: plot.epiflows

### ** Examples

data("Brazil_epiflows")

# no coordinates, defaults to network
plot(Brazil_epiflows) 

# grid bubbleplot
plot(Brazil_epiflows, "grid")

# adding coordinates defaults to map
data("YF_coordinates")
ef <- add_coordinates(Brazil_epiflows, YF_coordinates[-1])
plot(ef)



