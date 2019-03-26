library(forecast)


### Name: mstl
### Title: Multiple seasonal decomposition
### Aliases: mstl

### ** Examples

library(ggplot2)
mstl(taylor) %>% autoplot(facet=TRUE)
mstl(AirPassengers, lambda='auto') %>% autoplot(facet=TRUE)



