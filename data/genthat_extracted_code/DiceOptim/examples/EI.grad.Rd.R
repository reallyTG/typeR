library(DiceOptim)


### Name: EI.grad
### Title: Analytical gradient of the Expected Improvement criterion
### Aliases: EI.grad
### Keywords: models optimize

### ** Examples

## Not run: 
##D set.seed(123)
##D # a 9-points factorial design, and the corresponding response
##D d <- 2; n <- 9
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
##D # graphics
##D n.grid <- 50
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D #response.grid <- apply(design.grid, 1, branin)
##D EI.grid <- apply(design.grid, 1, EI,fitted.model1)
##D #EI.grid <- apply(design.grid, 1, EI.plot,fitted.model1, gr=TRUE)
##D 
##D z.grid <- matrix(EI.grid, n.grid, n.grid)
##D 
##D contour(x.grid,y.grid,z.grid,20)
##D title("Expected Improvement for the Branin function known at 9 points")
##D points(design.fact[,1], design.fact[,2], pch=17, col="blue")
##D 
##D # graphics
##D n.gridx <- 15
##D n.gridy <- 20
##D x.grid2 <- seq(0,1,length=n.gridx)
##D y.grid2 <- seq(0,1,length=n.gridy)
##D design.grid2 <- expand.grid(x.grid2, y.grid2)
##D 
##D EI.envir <- new.env()
##D 	environment(EI) <- environment(EI.grad) <- EI.envir
##D 
##D options(warn=-1)
##D for(i in seq(1, nrow(design.grid2)) )
##D {
##D 	x <- design.grid2[i,]
##D 	ei <- EI(x, model=fitted.model1, envir=EI.envir)
##D 	eigrad <- EI.grad(x , model=fitted.model1, envir=EI.envir)
##D 	if(!(is.null(ei)))
##D 	{
##D 	arrows(x$Var1,x$Var2,
##D 	x$Var1 + eigrad[1]*2.2*10e-5, x$Var2 + eigrad[2]*2.2*10e-5,
##D 	length = 0.04, code=2, col="orange", lwd=2)
##D 	}
##D }
## End(Not run)



