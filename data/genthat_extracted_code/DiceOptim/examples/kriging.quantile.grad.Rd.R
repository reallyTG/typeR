library(DiceOptim)


### Name: kriging.quantile.grad
### Title: Analytical gradient of the Kriging quantile of level beta
### Aliases: kriging.quantile.grad
### Keywords: models optimize

### ** Examples

## Not run: 
##D ##########################################################################
##D ###    KRIGING QUANTILE SURFACE AND ITS GRADIENT FOR                  ####
##D ###    THE BRANIN FUNCTION KNOWN AT A 12-POINT LATIN HYPERCUBE DESIGN ####
##D ##########################################################################
##D set.seed(421)
##D 
##D # Set test problem parameters
##D doe.size <- 12
##D dim <- 2
##D test.function <- get("branin2")
##D lower <- rep(0,1,dim)
##D upper <- rep(1,1,dim)
##D noise.var <- 0.2
##D 
##D # Generate DOE and response
##D doe <- as.data.frame(matrix(runif(doe.size*dim),doe.size))
##D y.tilde <- rep(0, 1, doe.size)
##D for (i in 1:doe.size)  {
##D y.tilde[i] <- test.function(doe[i,]) + sqrt(noise.var)*rnorm(n=1)
##D }
##D y.tilde <- as.numeric(y.tilde)
##D 
##D # Create kriging model
##D model <- km(y~1, design=doe, response=data.frame(y=y.tilde),
##D         covtype="gauss", noise.var=rep(noise.var,1,doe.size),
##D 	lower=rep(.1,dim), upper=rep(1,dim), control=list(trace=FALSE))
##D 
##D # Compute actual function and criterion on a grid
##D n.grid <- 12 # Change to 21 for a nicer picture
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D nt <- nrow(design.grid)
##D 
##D crit.grid <- apply(design.grid, 1, kriging.quantile, model=model, beta=.1)
##D crit.grad <- t(apply(design.grid, 1, kriging.quantile.grad, model=model, beta=.1))
##D 
##D z.grid <- matrix(crit.grid, n.grid, n.grid)
##D contour(x.grid,y.grid, z.grid, 30)
##D title("kriging.quantile and its gradient")
##D points(model@X[,1],model@X[,2],pch=17,col="blue")
##D 
##D for (i in 1:nt)
##D {
##D  x <- design.grid[i,]
##D  arrows(x$Var1,x$Var2, x$Var1+crit.grad[i,1]*.01,x$Var2+crit.grad[i,2]*.01,
##D length=0.04,code=2,col="orange",lwd=2)
##D }
## End(Not run)



