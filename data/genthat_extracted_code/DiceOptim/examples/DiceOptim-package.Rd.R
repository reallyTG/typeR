library(DiceOptim)


### Name: DiceOptim-package
### Title: Kriging-based optimization methods for computer experiments
### Aliases: DiceOptim DiceOptim-package

### ** Examples

set.seed(123)
## No test: 
###############################################################
###	2D optimization USING EGO.nsteps and qEGO.nsteps   ########
###############################################################

# a 9-points factorial design, and the corresponding response
d <- 2
n <- 9
design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
names(design.fact)<-c("x1", "x2")
design.fact <- data.frame(design.fact)
names(design.fact)<-c("x1", "x2")
response.branin <- data.frame(apply(design.fact, 1, branin))
names(response.branin) <- "y"

# model identification
fitted.model1 <- km(~1, design=design.fact, response=response.branin,
covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))

### EGO, 5 steps ##################
library(rgenoud)
nsteps <- 5
lower <- rep(0,d)
upper <- rep(1,d)
oEGO <- EGO.nsteps(model=fitted.model1, fun=branin, nsteps=nsteps,
lower=lower, upper=upper, control=list(pop.size=20, BFGSburnin=2))
print(oEGO$par)
print(oEGO$value)

# graphics
n.grid <- 15
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, branin)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid, y.grid, z.grid, 40)
title("EGO")
points(design.fact[,1], design.fact[,2], pch=17, col="blue")
points(oEGO$par, pch=19, col="red")
text(oEGO$par[,1], oEGO$par[,2], labels=1:nsteps, pos=3)

### Parallel EGO, 3 steps with batches of 3 ##############
nsteps <- 3
lower <- rep(0,d)
upper <- rep(1,d)
npoints <- 3 # The batchsize
oEGO <- qEGO.nsteps(model = fitted.model1, branin, npoints = npoints, nsteps = nsteps,
crit="exact", lower, upper, optimcontrol = NULL)
print(oEGO$par)
print(oEGO$value)

# graphics
contour(x.grid, y.grid, z.grid, 40)
title("qEGO")
points(design.fact[,1], design.fact[,2], pch=17, col="blue")
points(oEGO$par, pch=19, col="red")
text(oEGO$par[,1], oEGO$par[,2], labels=c(tcrossprod(rep(1,npoints),1:nsteps)), pos=3)

##########################################################################
### 2D OPTIMIZATION, NOISY OBJECTIVE                                   ###
##########################################################################

set.seed(10)
library(DiceDesign)
# Set test problem parameters
doe.size <- 9
dim <- 2
test.function <- get("branin2")
lower <- rep(0,1,dim)
upper <- rep(1,1,dim)
noise.var <- 0.1

# Build noisy simulator
funnoise <- function(x)
{     f.new <- test.function(x) + sqrt(noise.var)*rnorm(n=1)
      return(f.new)}

# Generate DOE and response
doe <- as.data.frame(lhsDesign(doe.size, dim)$design)
y.tilde <- funnoise(doe)

# Create kriging model
model <- km(y~1, design=doe, response=data.frame(y=y.tilde),
     covtype="gauss", noise.var=rep(noise.var,1,doe.size),
     lower=rep(.1,dim), upper=rep(1,dim), control=list(trace=FALSE))

# Optimisation with noisy.optimizer
optim.param <- list()
optim.param$quantile <- .7
optim.result <- noisy.optimizer(optim.crit="EQI", optim.param=optim.param, model=model,
		n.ite=5, noise.var=noise.var, funnoise=funnoise, lower=lower, upper=upper,
		NoiseReEstimate=FALSE, CovReEstimate=FALSE)

print(optim.result$best.x)

##########################################################################
### 2D OPTIMIZATION, 2 INEQUALITY CONSTRAINTS                          ###
##########################################################################
set.seed(25468)
library(DiceDesign)

fun <- goldsteinprice
fun1.cst <- function(x){return(-branin(x) + 25)}
fun2.cst <- function(x){return(3/2 - x[1] - 2*x[2] - .5*sin(2*pi*(x[1]^2 - 2*x[2])))}
constraint <- function(x){return(c(fun1.cst(x), fun2.cst(x)))}

lower <- rep(0, 2)
upper <- rep(1, 2)

## Optimization using the Expected Feasible Improvement criterion
res <- easyEGO.cst(fun=fun, constraint=constraint, n.cst=2, lower=lower, upper=upper, budget=10,
                   control=list(method="EFI", inneroptim="genoud", maxit=20))

cat("best design found:", res$par, "\n")
cat("corresponding objective and constraints:", res$value, "\n")

# Objective function in colour, constraint boundaries in red
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

n.grid <- 15
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun)
cst1.grid <- apply(test.grid, 1, fun1.cst)
cst2.grid <- apply(test.grid, 1, fun2.cst)
filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid), main = "Two inequality constraints",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst1.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE, lwd=1.5, col = "red")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                    lwd=1.5, col = "red")
                            points(res$history$X, col = "blue", pch = 4, lwd = 2)
                            points(res$par[1], res$par[2], col = "red", pch = 4, lwd = 2, cex=2)
               }
)
## End(No test)



