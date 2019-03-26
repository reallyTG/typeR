library(restriktor)


### Name: con_weights_boot
### Title: function for computing the chi-bar-square weights based on Monte
###   Carlo simulation.
### Aliases: con_weights_boot

### ** Examples

W <- matrix(c(1,0.5,0.5,1),2,2)
Amat <- rbind(c(0,1))
meq <- 0L
# we only generate 999 bootstrap samples in this 
# example; in practice you may wish to use a much higher number.
wt.bar <- con_weights_boot(W, Amat, meq, R = 999)
wt.bar



