library(Corbi)


### Name: get_subnets
### Title: All subnetworks of limited size
### Aliases: get_subnets

### ** Examples


library(Corbi)
net <- matrix(FALSE, nrow=10, ncol=10)
net[sample.int(100, 20)] <- TRUE
net <- net | t(net)
subnets <- get_subnets(net, 3)




