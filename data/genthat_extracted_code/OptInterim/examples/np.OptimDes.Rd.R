library(OptInterim)


### Name: np.OptimDes
### Title: Optimal Two-Stage or Three-Stage Designs with User-specified
###   Combined Sample Size or Study Length
### Aliases: np.OptimDes
### Keywords: design optimize

### ** Examples

## Not run: 
##D B.init <- c(1, 2, 3, 4, 5)
##D m.init <- c(15, 20, 25, 20, 15)
##D alpha <- 0.05
##D beta <- 0.1
##D param <- c(1, 1.09, 2, 1.40)
##D x <- 1
##D 
##D # H0: S0=0.40 H1: S1=0.60
##D 
##D object14 <- np.OptimDes(B.init,m.init,alpha,beta,param,x,pt=1.1,target="ETSL",sf="futility",num.arm=1,num.stage=2)
## End(Not run)



