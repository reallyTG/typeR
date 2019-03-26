library(DiceOptim)


### Name: max_AKG
### Title: Maximizer of the Expected Quantile Improvement criterion
###   function
### Aliases: max_AKG

### ** Examples

##########################################################################
###    AKG SURFACE AND OPTIMIZATION PERFORMED BY GENOUD               ####
###    FOR AN ORDINARY KRIGING MODEL                                  ####
### OF THE BRANIN FUNCTION KNOWN AT A 12-POINT LATIN HYPERCUBE DESIGN ####
##########################################################################
set.seed(10)

# Set test problem parameters
doe.size <- 10
dim <- 2
test.function <- get("branin2")
lower <- rep(0,1,dim)
upper <- rep(1,1,dim)
noise.var <- 0.2

# Generate DOE and response
library(DiceDesign)
doe <- as.data.frame(lhsDesign(doe.size, dim)$design)
y.tilde <- rep(0, 1, doe.size)
for (i in 1:doe.size)  {y.tilde[i] <- test.function(doe[i,])
+ sqrt(noise.var)*rnorm(n=1)}
y.tilde <- as.numeric(y.tilde)

# Create kriging model
model <- km(y~1, design=doe, response=data.frame(y=y.tilde),
     covtype="gauss", noise.var=rep(noise.var,1,doe.size),
     lower=rep(.1,dim), upper=rep(1,dim), control=list(trace=FALSE))

# Optimisation using max_AKG
res <- max_AKG(model, new.noise.var=noise.var, type = "UK",
lower=c(0,0), upper=c(1,1))
X.genoud <- res$par

## Not run: 
##D # Compute actual function and criterion on a grid
##D n.grid <- 12 # Change to 21 for a nicer picture
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D names(design.grid) <- c("V1","V2")
##D nt <- nrow(design.grid)
##D crit.grid <- apply(design.grid, 1, AKG, model=model, new.noise.var=noise.var)
##D 
##D # # 2D plots
##D z.grid <- matrix(crit.grid, n.grid, n.grid)
##D tit <- "Green: best point found by optimizer"
##D filled.contour(x.grid,y.grid, z.grid, nlevels=50, color = topo.colors,
##D plot.axes = {title(tit);points(model@X[,1],model@X[,2],pch=17,col="blue");
##D points(X.genoud[1],X.genoud[2],pch=17,col="green");
##D axis(1); axis(2)})
## End(Not run)



