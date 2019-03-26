library(OptInterim)


### Name: SimDes
### Title: Simulation Studies for Two-Stage or Three-Stage Designs from
###   function OptimDes
### Aliases: SimDes
### Keywords: iteration optimize

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
##D object1 <- OptimDes(B.init,m.init,alpha,beta,param,x,target="EDA",sf="futility",num.arm=1)
##D 
##D SimDes(object1,sim.n=100)
##D 
##D ### Stopping based on pre=planned time of analysis
##D SimDes(object1,interimRule='t1',sim.n=100)
##D 
##D ### accrual rates differ from planned
##D SimDes(object1,m.init=c(5,5,25,25,25),sim.n=100)
## End(Not run)



