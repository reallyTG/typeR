library(DiceOptim)


### Name: max_EI
### Title: Maximization of the Expected Improvement criterion
### Aliases: max_EI
### Keywords: optimize

### ** Examples

set.seed(123)
##########################################################
### "ONE-SHOT" EI-MAXIMIZATION OF THE BRANIN FUNCTION ####
### 	KNOWN AT A 9-POINTS FACTORIAL DESIGN          ####
##########################################################

# a 9-points factorial design, and the corresponding response
d <- 2
n <- 9
design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
names(design.fact) <- c("x1", "x2")
design.fact <- data.frame(design.fact)
names(design.fact) <- c("x1", "x2")
response.branin <- apply(design.fact, 1, branin)
response.branin <- data.frame(response.branin)
names(response.branin) <- "y"

# model identification
fitted.model1 <- km(~1, design=design.fact, response=response.branin,
covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))

# EGO one step
library(rgenoud)
lower <- rep(0,d)
upper <- rep(1,d)     # domain for Branin function
oEGO <- max_EI(fitted.model1, lower=lower, upper=upper,
control=list(pop.size=20, BFGSburnin=2))
print(oEGO)

# graphics
n.grid <- 20
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, branin)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid,y.grid,z.grid,40)
title("Branin Function")
points(design.fact[,1], design.fact[,2], pch=17, col="blue")
points(oEGO$par[1], oEGO$par[2], pch=19, col="red")


#############################################################
### "ONE-SHOT" EI-MAXIMIZATION OF THE CAMELBACK FUNCTION ####
###	KNOWN AT A 16-POINTS FACTORIAL DESIGN            ####
#############################################################
## Not run: 
##D # a 16-points factorial design, and the corresponding response
##D d <- 2
##D n <- 16
##D design.fact <- expand.grid(seq(0,1,length=4), seq(0,1,length=4))
##D names(design.fact)<-c("x1", "x2")
##D design.fact <- data.frame(design.fact)
##D names(design.fact) <- c("x1", "x2")
##D response.camelback <- apply(design.fact, 1, camelback)
##D response.camelback <- data.frame(response.camelback)
##D names(response.camelback) <- "y"
##D 
##D # model identification
##D fitted.model1 <- km(~1, design=design.fact, response=response.camelback,
##D covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))
##D 
##D # EI maximization
##D library(rgenoud)
##D lower <- rep(0,d)
##D upper <- rep(1,d)
##D oEGO <- max_EI(fitted.model1, lower=lower, upper=upper,
##D control=list(pop.size=20, BFGSburnin=2))
##D print(oEGO)
##D 
##D # graphics
##D n.grid <- 20
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D response.grid <- apply(design.grid, 1, camelback)
##D z.grid <- matrix(response.grid, n.grid, n.grid)
##D contour(x.grid,y.grid,z.grid,40)
##D title("Camelback Function")
##D points(design.fact[,1], design.fact[,2], pch=17, col="blue")
##D points(oEGO$par[1], oEGO$par[2], pch=19, col="red")
## End(Not run)

####################################################################
### "ONE-SHOT" EI-MAXIMIZATION OF THE GOLDSTEIN-PRICE FUNCTION #####
### 	     KNOWN AT A 9-POINTS FACTORIAL DESIGN              #####
####################################################################

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
##D wait.generations=5, BFGSburnin=10, trace=FALSE), parinit=c(0.5, 0.5), optim.method="gen")
##D 
##D # EI maximization
##D library(rgenoud)
##D lower <- rep(0,d); upper <- rep(1,d);     # domain for Branin function
##D oEGO <- max_EI(fitted.model1, lower=lower, upper=upper, control
##D =list(pop.size=50, max.generations=50, wait.generations=5, BFGSburnin=10))
##D print(oEGO)
##D 
##D # graphics
##D n.grid <- 20
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D response.grid <- apply(design.grid, 1, goldsteinPrice)
##D z.grid <- matrix(response.grid, n.grid, n.grid)
##D contour(x.grid,y.grid,z.grid,40)
##D title("Goldstein-Price Function")
##D points(design.fact[,1], design.fact[,2], pch=17, col="blue")
##D points(oEGO$par[1], oEGO$par[2], pch=19, col="red")
## End(Not run)



