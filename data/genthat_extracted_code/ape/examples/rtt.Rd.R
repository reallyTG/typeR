library(ape)


### Name: rtt
### Title: Root a Tree by Root-to-Tip Regression
### Aliases: rtt

### ** Examples

t <- rtree(100)
tip.date <- rnorm(t$tip.label)^2
rtt(t, tip.date)



