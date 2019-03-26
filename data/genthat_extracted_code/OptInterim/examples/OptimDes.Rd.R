library(OptInterim)


### Name: OptimDes
### Title: Construct Optimal Two-stage or Three-stage Designs with
###   Time-to-event Endpoints Evaluated at a Pre-specified Time
### Aliases: OptimDes
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
##D object12 <- OptimDes(B.init,m.init,alpha,beta,param,x,target="EDA",
##D sf="futility",num.arm=1,num.stage=2,control=OptimDesControl(n.int=c(1,5),trace=TRUE))
##D print(object12)
##D 
##D 
##D m.init <- 4*c(15, 20, 25, 20, 15)
##D object2 <- OptimDes(B.init,m.init,alpha,beta,param,x,target="EDA",sf="futility",num.arm=2)
##D print(object2)
##D 
##D object23O <- OptimDes(B.init,m.init,alpha,beta,param,x,target="ETSL",sf="OF",
##D num.arm=2,num.stage=3,control=OptimDesControl(trace=TRUE,aboveMin=c(1.05,1.10)))
##D print(object3)
## End(Not run)




