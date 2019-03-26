library(multinet)


### Name: Plotting
### Title: Drawing a multilayer network
### Aliases: Plotting plot.Rcpp_RMLNetwork plot.ml

### ** Examples

net <- ml.florentine()
## Not run: 
##D plot(net)
##D c <- clique.percolation.ml(net)
##D plot(net,vertex.labels.cex=.5,com=c)
## End(Not run)
net <- ml.aucs()
## Not run: 
##D plot(net,vertex.labels=NA)
##D title("AUCS network")
## End(Not run)



