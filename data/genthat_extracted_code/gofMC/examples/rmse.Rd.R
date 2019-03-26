library(gofMC)


### Name: rmse
### Title: rmse
### Aliases: rmse

### ** Examples

rmse(c(2:20),c(2:20 + c(rep(0.1,5),rep(-0.2,10),rep(0.3,4))))
mata <- matrix(runif(10000),ncol=5)
matb <- matrix(runif(10000),ncol=5)
rmse(mata, matb)




