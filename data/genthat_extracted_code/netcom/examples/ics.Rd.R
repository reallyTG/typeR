library(netcom)


### Name: ics
### Title: Induced Conserved Structure (ICS)
### Aliases: ics

### ** Examples

# Note that ICS is only defined on unweighted networks.
net_one <- round(matrix(runif(25,0,1), nrow=5, ncol=5))
net_two <- round(matrix(runif(25,0,1), nrow=5, ncol=5))

ics(net_two, net_two, align(net_one, net_two)$alignment)




