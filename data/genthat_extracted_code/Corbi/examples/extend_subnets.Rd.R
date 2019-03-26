library(Corbi)


### Name: extend_subnets
### Title: Extend subnetworks from smaller subnetworks
### Aliases: extend_subnets

### ** Examples


library(Corbi)
net <- matrix(FALSE, nrow=10, ncol=10)
net[sample.int(100, 20)] <- TRUE
net <- net | t(net)
subnets <- get_subnets(net, 3)
subnets[[4]] <- extend_subnets(subnets[[3]], subnets[[2]], 4)




