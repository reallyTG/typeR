library(ade4)


### Name: randboot
### Title: Bootstrap simulations
### Aliases: as.krandboot print.krandboot as.randboot print.randboot
###   randboot
### Keywords: htest

### ** Examples

## an example corresponding to 10 statistics and 100 repetitions
bt <- as.krandboot(obs = rnorm(10), boot = matrix(rnorm(1000), nrow = 100))
bt
if(adegraphicsLoaded())
plot(bt) 




