library(netcom)


### Name: align
### Title: Network Alignment
### Aliases: align

### ** Examples

# The two networks to be aligned
net_one <- matrix(runif(25,0,1), nrow=5, ncol=5)
net_two <- matrix(runif(25,0,1), nrow=5, ncol=5)

align(net_one, net_two)
align(net_one, net_two, base = 1, characterization = "gini", normalization = TRUE)




