library(marima)


### Name: pol.order
### Title: pol.order
### Aliases: pol.order

### ** Examples

pol          <- array(1e-8*rnorm(96),dim=c(4,4,6))
pol[, , 1:3] <- array(rnorm(48), dim=c(4,4,3))
pol.order(polyn=pol, digits=12)
pol.order(polyn=pol, digits=4)




