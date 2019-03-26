library(networktools)


### Name: plot.bridge
### Title: Plot "bridge" objects
### Aliases: plot.bridge

### ** Examples

## No test: 
b <- bridge(cor(depression))
plot(b)
plot(b, order="value", zscore=TRUE)
plot(b, include=c("Bridge Strength", "Bridge Betweenness"))
## End(No test)



