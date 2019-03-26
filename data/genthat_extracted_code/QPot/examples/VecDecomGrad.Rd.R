library(QPot)


### Name: VecDecomGrad
### Title: Vector decomposition and remainder fields
### Aliases: VecDecomGrad
### Keywords: decomposition, field gradient vector

### ** Examples

# First, the system of equations
	equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0+x*x)"
	equationy <- "((0.476*x*x*y)/(1+x*x)) - 0.112590*y*y"

# Second, shared parameters for each quasi-potential run
	xbounds <- c(-0.5, 10.0)
	ybounds <- c(-0.5, 10.0)
	xstepnumber <- 100
	ystepnumber <- 100

# Third, first local quasi-potential run
	xinit1 <- 1.40491
	yinit1 <- 2.80808
	storage.eq1 <- QPotential(x.rhs = equationx, x.start = xinit1, 
	x.bound = xbounds, x.num.steps = xstepnumber, y.rhs = equationy, 
	y.start = yinit1, y.bound = ybounds, y.num.steps = ystepnumber)

# Fourth, second local quasi-potential run
	xinit2 <- 4.9040
	yinit2 <- 4.06187
	storage.eq2 <- QPotential(x.rhs = equationx, x.start = xinit2, 
	x.bound = xbounds, x.num.steps = xstepnumber, y.rhs = equationy, 
	y.start = yinit2, y.bound = ybounds, y.num.steps = ystepnumber)

# Fifth, determine global quasi-potential 
	unst.x <- c(0, 4.2008)
	unst.y <- c(0, 4.0039)
	ex1.global <- QPGlobal(local.surfaces = list(storage.eq1, storage.eq2), 
	unstable.eq.x = unst.x, unstable.eq.y = unst.y, x.bound = xbounds, 
	y.bound = ybounds)

# Sixth, creat the gradient vector field
	VDG <- VecDecomGrad(surface = ex1.global)



