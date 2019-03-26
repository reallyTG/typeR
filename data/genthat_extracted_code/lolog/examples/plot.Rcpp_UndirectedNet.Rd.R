library(lolog)


### Name: plot.Rcpp_UndirectedNet
### Title: Plot an UndirectedNet object
### Aliases: plot.Rcpp_UndirectedNet

### ** Examples

el <- matrix(c(1,2),ncol=2)
net <- new(UndirectedNet, el, 5L)
net[1,5] <- 1
net[2,5] <- 1
plot(net)



