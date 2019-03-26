library(DiceOptim)


### Name: EGO.nsteps
### Title: Sequential EI maximization and model re-estimation, with a
###   number of iterations fixed in advance by the user
### Aliases: EGO.nsteps
### Keywords: optimize

### ** Examples

set.seed(123)
###############################################################
### 	10 ITERATIONS OF EGO ON THE BRANIN FUNCTION, 	   ####
###	 STARTING FROM A 9-POINTS FACTORIAL DESIGN         ####
###############################################################

# a 9-points factorial design, and the corresponding response
d <- 2
n <- 9
design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
names(design.fact)<-c("x1", "x2")
design.fact <- data.frame(design.fact)
names(design.fact)<-c("x1", "x2")
response.branin <- apply(design.fact, 1, branin)
response.branin <- data.frame(response.branin)
names(response.branin) <- "y"

# model identification
fitted.model1 <- km(~1, design=design.fact, response=response.branin,
covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))

# EGO n steps
library(rgenoud)
nsteps <- 5 # Was 10, reduced to 5 for speeding up compilation
lower <- rep(0,d)
upper <- rep(1,d)
oEGO <- EGO.nsteps(model=fitted.model1, fun=branin, nsteps=nsteps,
lower=lower, upper=upper, control=list(pop.size=20, BFGSburnin=2))
print(oEGO$par)
print(oEGO$value)

# graphics
n.grid <- 15 # Was 20, reduced to 15 for speeding up compilation
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, branin)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid, y.grid, z.grid, 40)
title("Branin function")
points(design.fact[,1], design.fact[,2], pch=17, col="blue")
points(oEGO$par, pch=19, col="red")
text(oEGO$par[,1], oEGO$par[,2], labels=1:nsteps, pos=3)


###############################################################
### 	20 ITERATIONS OF EGO ON THE GOLDSTEIN-PRICE,  	   ####
###	 STARTING FROM A 9-POINTS FACTORIAL DESIGN   	   ####
###############################################################
## Not run: 
##D # a 9-points factorial design, and the corresponding response
##D d <- 2
##D n <- 9
##D design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
##D names(design.fact)<-c("x1", "x2")
##D design.fact <- data.frame(design.fact)
##D names(design.fact)<-c("x1", "x2")
##D response.goldsteinPrice <- apply(design.fact, 1, goldsteinPrice)
##D response.goldsteinPrice <- data.frame(response.goldsteinPrice)
##D names(response.goldsteinPrice) <- "y"
##D 
##D # model identification
##D fitted.model1 <- km(~1, design=design.fact, response=response.goldsteinPrice,
##D covtype="gauss", control=list(pop.size=50, max.generations=50,
##D wait.generations=5, BFGSburnin=10,trace=FALSE), parinit=c(0.5, 0.5), optim.method="BFGS")
##D 
##D # EGO n steps
##D library(rgenoud)
##D nsteps <- 10 # Was 20, reduced to 10 for speeding up compilation
##D lower <- rep(0,d)
##D upper <- rep(1,d)
##D oEGO <- EGO.nsteps(model=fitted.model1, fun=goldsteinPrice, nsteps=nsteps,
##D lower, upper, control=list(pop.size=20, BFGSburnin=2))
##D print(oEGO$par)
##D print(oEGO$value)
##D 
##D # graphics
##D n.grid <- 15 # Was 20, reduced to 15 for speeding up compilation
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D response.grid <- apply(design.grid, 1, goldsteinPrice)
##D z.grid <- matrix(response.grid, n.grid, n.grid)
##D contour(x.grid, y.grid, z.grid, 40)
##D title("Goldstein-Price Function")
##D points(design.fact[,1], design.fact[,2], pch=17, col="blue")
##D points(oEGO$par, pch=19, col="red")
##D text(oEGO$par[,1], oEGO$par[,2], labels=1:nsteps, pos=3)
## End(Not run)

#######################################################################
### 	nsteps ITERATIONS OF EGO ON THE HARTMAN6 FUNCTION,  	   ####
###	  STARTING FROM A 10-POINTS UNIFORM DESIGN      	   ####
#######################################################################

## Not run: 
##D fonction<-hartman6
##D data(mydata)
##D a <- mydata
##D nb<-10
##D nsteps <- 3 # Maybe be changed to a larger value
##D x1<-a[[1]][1:nb];x2<-a[[2]][1:nb];x3<-a[[3]][1:nb]
##D x4<-a[[4]][1:nb];x5<-a[[5]][1:nb];x6<-a[[6]][1:nb]
##D design <- data.frame(cbind(x1,x2,x3,x4,x5,x6))
##D names(design)<-c("x1", "x2","x3","x4","x5","x6")
##D n <- nrow(design)
##D 
##D response <- data.frame(q=apply(design,1,fonction))
##D names(response) <- "y"
##D fitted.model1 <- km(~1, design=design, response=response, covtype="gauss",
##D control=list(pop.size=50, max.generations=20, wait.generations=5, BFGSburnin=5,
##D trace=FALSE), optim.method="gen", parinit=rep(0.8,6))
##D 
##D res.nsteps <- EGO.nsteps(model=fitted.model1, fun=fonction, nsteps=nsteps,
##D lower=rep(0,6), upper=rep(1,6), parinit=rep(0.5,6), control=list(pop.size=50,
##D max.generations=20, wait.generations=5, BFGSburnin=5), kmcontrol=NULL)
##D print(res.nsteps)
##D plot(res.nsteps$value,type="l")
## End(Not run)



