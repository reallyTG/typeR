library(DiceOptim)


### Name: qEGO.nsteps
### Title: Sequential multipoint Expected improvement (qEI) maximizations
###   and model re-estimation
### Aliases: qEGO.nsteps
### Keywords: optimize

### ** Examples

## Not run: 
##D set.seed(123)
##D #####################################################
##D ### 4 ITERATIONS OF EGO ON THE BRANIN FUNCTION,   ###
##D ### STARTING FROM A 9-POINTS FACTORIAL DESIGN     ###
##D #####################################################
##D 
##D # a 9-points factorial design, and the corresponding response
##D d <- 2
##D n <- 9
##D design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
##D names(design.fact)<-c("x1", "x2")
##D design.fact <- data.frame(design.fact)
##D names(design.fact)<-c("x1", "x2")
##D response.branin <- apply(design.fact, 1, branin)
##D response.branin <- data.frame(response.branin)
##D names(response.branin) <- "y"
##D 
##D # model identification
##D fitted.model1 <- km(~1, design=design.fact, response=response.branin,
##D covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))
##D 
##D # EGO n steps
##D library(rgenoud)
##D nsteps <- 4 # Was 10, reduced to 4 for speeding up execution
##D lower <- rep(0,d)
##D upper <- rep(1,d)
##D npoints <- 3 # The batchsize
##D oEGO <- qEGO.nsteps(model = fitted.model1, branin, npoints = npoints, nsteps = nsteps,
##D crit="exact", lower, upper, optimcontrol = NULL)
##D print(oEGO$par)
##D print(oEGO$value)
##D plot(c(1:nsteps),oEGO$history,xlab='step',ylab='Current known minimum')
##D 
##D # graphics
##D n.grid <- 15 # Was 20, reduced to 15 for speeding up compilation
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D response.grid <- apply(design.grid, 1, branin)
##D z.grid <- matrix(response.grid, n.grid, n.grid)
##D contour(x.grid, y.grid, z.grid, 40)
##D title("Branin function")
##D points(design.fact[,1], design.fact[,2], pch=17, col="blue")
##D points(oEGO$par, pch=19, col="red")
##D text(oEGO$par[,1], oEGO$par[,2], labels=c(tcrossprod(rep(1,npoints),1:nsteps)), pos=3)
## End(Not run)



