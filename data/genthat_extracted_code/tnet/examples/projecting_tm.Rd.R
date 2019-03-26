library(tnet)


### Name: projecting_tm
### Title: Projecting binary and weighted two-mode networks onto weighted
###   one-mode networks.
### Aliases: projecting_tm

### ** Examples

## define two-mode network
two.mode.net <- cbind(
i=c(1,1,2,2,2,2,2,3,4,5,5,5,6),
p=c(1,2,1,2,3,4,5,2,3,4,5,6,6))

## Run the function
projecting_tm(two.mode.net, method="Newman")




