library(migest)


### Name: ipf_net
### Title: Iterative Proportional Fitting Routine for the Indirect
###   Estimation of Origin-Destination-Type Migration Flow Tables with
###   Known Net Migration Totals.
### Aliases: ipf_net

### ** Examples

m <- matrix(data = 1:16, nrow = 4)
y <- ipf_net(ntot = c(30, 40, -15, -55), m = m)
addmargins(m)
net_sum(y$mu)



