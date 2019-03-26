library(QPot)


### Name: VecDecomPlot
### Title: Plotting function for vector decomposition and remainder fields
### Aliases: VecDecomPlot
### Keywords: detrministic field gradient plot plot, remainder skeleton
###   vector

### ** Examples

# First, system of equations
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

# Sixth, decompose the global quasi-potential into the 
# deterministic skeleton, gradient, and remainder vector fields
	VDAll <- VecDecomAll(surface = ex1.global, x.rhs = equationx, y.rhs = equationy, 
	x.bound = xbounds, y.bound = ybounds)

# Seventh, plot all three vector fields
	# The deterministic skeleton vector field
	VecDecomPlot(x.field = VDAll[,,1], y.field = VDAll[,,2], dens = c(25,25), 
	x.bound = xbounds, y.bound = ybounds, tail.length = 0.25, head.length = 0.05)
	# The gradient vector field
	VecDecomPlot(x.field = VDAll[,,3], y.field = VDAll[,,4], dens = c(25,25), 
	x.bound = xbounds, y.bound = ybounds, tail.length = 0.15, head.length = 0.05)
	# The remainder vector field
	VecDecomPlot(x.field = VDAll[,,5], y.field = VDAll[,,6], dens = c(25,25), 
	x.bound = xbounds, y.bound = ybounds, tail.length = 0.15, head.length = 0.05)



