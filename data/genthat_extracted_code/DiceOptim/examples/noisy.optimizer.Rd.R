library(DiceOptim)


### Name: noisy.optimizer
### Title: Optimization of homogenously noisy functions based on Kriging
### Aliases: noisy.optimizer

### ** Examples

##########################################################################
### EXAMPLE 1: 3 OPTIMIZATION STEPS USING EQI WITH KNOWN NOISE         ###
### AND KNOWN COVARIANCE PARAMETERS FOR THE BRANIN FUNCTION            ###
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

# Optimisation with noisy.optimizer (n.ite can be increased)
n.ite <- 2
optim.param <- list()
optim.param$quantile <- .9
optim.result <- noisy.optimizer(optim.crit="EQI", optim.param=optim.param, model=model,
		n.ite=n.ite, noise.var=noise.var, funnoise=funnoise, lower=lower, upper=upper,
		NoiseReEstimate=FALSE, CovReEstimate=FALSE)

new.model <- optim.result$model
best.x    <- optim.result$best.x
new.doe   <- optim.result$history.x

## Not run: 
##D ##### DRAW RESULTS #####
##D # Compute actual function on a grid
##D n.grid <- 12
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D names(design.grid) <- c("V1","V2")
##D nt <- nrow(design.grid)
##D func.grid <- rep(0,1,nt)
##D 
##D for (i in 1:nt)
##D { func.grid[i] <- test.function(x=design.grid[i,])}
##D 
##D # Compute initial and final kriging on a grid
##D pred <- predict(object=model, newdata=design.grid, type="UK", checkNames = FALSE)
##D mk.grid1 <- pred$m
##D sk.grid1 <- pred$sd
##D 
##D pred <- predict(object=new.model, newdata=design.grid, type="UK", checkNames = FALSE)
##D mk.grid2 <- pred$m
##D sk.grid2 <- pred$sd
##D 
##D # Plot initial kriging mean
##D z.grid <- matrix(mk.grid1, n.grid, n.grid)
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title("Initial kriging mean");
##D points(model@X[,1],model@X[,2],pch=17,col="black");
##D axis(1); axis(2)})
##D 
##D # Plot initial kriging variance
##D z.grid <- matrix(sk.grid1^2, n.grid, n.grid)
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title("Initial kriging variance");
##D points(model@X[,1],model@X[,2],pch=17,col="black");
##D axis(1); axis(2)})
##D 
##D # Plot final kriging mean
##D z.grid <- matrix(mk.grid2, n.grid, n.grid)
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title("Final kriging mean");
##D points(new.model@X[,1],new.model@X[,2],pch=17,col="black");
##D axis(1); axis(2)})
##D 
##D # Plot final kriging variance
##D z.grid <- matrix(sk.grid2^2, n.grid, n.grid)
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title("Final kriging variance");
##D points(new.model@X[,1],new.model@X[,2],pch=17,col="black");
##D axis(1); axis(2)})
##D 
##D # Plot actual function and observations
##D z.grid <- matrix(func.grid, n.grid, n.grid)
##D tit <- "Actual function - Black: initial points; red: added points"
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title(tit);points(model@X[,1],model@X[,2],pch=17,col="black");
##D points(new.doe[1,],new.doe[2,],pch=15,col="red");
##D axis(1); axis(2)})
## End(Not run)

##########################################################################
### EXAMPLE 2: 3 OPTIMIZATION STEPS USING EQI WITH UNKNOWN NOISE       ###
### AND UNKNOWN COVARIANCE PARAMETERS FOR THE BRANIN FUNCTION          ###
##########################################################################
# Same initial model and parameters as for example 1
n.ite <- 2 # May be changed to a larger value
res <- noisy.optimizer(optim.crit="min.quantile",
optim.param=list(type="quantile",quantile=0.01),
model=model, n.ite=n.ite, noise.var=noise.var, funnoise=funnoise,
lower=lower, upper=upper,
control=list(print.level=0),CovReEstimate=TRUE, NoiseReEstimate=TRUE)

# Plot actual function and observations
plot(model@X[,1], model@X[,2], pch=17,xlim=c(0,1),ylim=c(0,1))
points(res$history.x[1,], res$history.x[2,], col="blue")

# Restart: requires the output estim.model of the previous run
# to deal with potential repetitions
res2 <- noisy.optimizer(optim.crit="min.quantile",
optim.param=list(type="quantile",quantile=0.01),
model=res$model, n.ite=n.ite, noise.var=noise.var, funnoise=funnoise,
lower=lower, upper=upper, estim.model=res$estim.model,
control=list(print.level=0),CovReEstimate=TRUE, NoiseReEstimate=TRUE)

# Plot new observations
points(res2$history.x[1,], res2$history.x[2,], col="red")



