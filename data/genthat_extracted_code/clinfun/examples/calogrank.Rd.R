library(clinfun)


### Name: calogrank
### Title: Survival curves analysis of covariance
### Aliases: calogrank
### Keywords: htest htest

### ** Examples

## Not run: 
##D   library(survival)
##D   data(pbc)
##D   pbc1 <- pbc
##D   pbc1$trt[pbc1$trt == -9] <- NA
##D   pbc1$copper[pbc1$copper == -9] <- NA
##D   calogrank(pbc1$time, pbc1$status, pbc1$trt, pbc1[,c("copper")])
##D   calogrank(pbc1$time, pbc1$status, pbc1$trt,
##D                                   pbc1[,c("protime", "copper")])
## End(Not run)



