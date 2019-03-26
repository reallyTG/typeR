library(Corbi)


### Name: best_subnets
### Title: The best subnetworks
### Aliases: best_subnets

### ** Examples


library(Corbi)
net <- matrix(FALSE, nrow=10, ncol=10)
net[sample.int(100, 20)] <- TRUE
net <- net | t(net)
func <- function(subnet) max(subnet) - min(subnet)
result <- best_subnets(func, net, 5)




