library(igraph)


### Name: time_bins.sir
### Title: SIR model on graphs
### Aliases: time_bins.sir median.sir quantile.sir sir median.sir
###   quantile.sir time_bins time_bins.sir
### Keywords: graphs

### ** Examples


g <- sample_gnm(100, 100)
sm <- sir(g, beta=5, gamma=1)
plot(sm)



