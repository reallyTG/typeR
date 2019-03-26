library(QPot)


### Name: QPotential
### Title: Computes the quasi-potential for a system of stochastic
###   differential equations using the upwind ordered method.
### Aliases: QPotential

### ** Examples

# First, System of equations
	equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0+x*x)"
	equationy <- "((0.476*x*x*y)/(1+x*x)) - 0.112590*y*y"

# Second, shared parameters for each quasi-potential run
	xbounds <- c(-0.5, 8.0)
	ybounds <- c(-0.5, 8.0)
	xstepnumber <- 200
	ystepnumber <- 200

# Third, a local quasi-potential run
	xinit1 <- 1.40491
	yinit1 <- 2.80808
	storage.eq1 <- QPotential(x.rhs = equationx, x.start = xinit1, 
	x.bound = xbounds, x.num.steps = xstepnumber, y.rhs = equationy, 
	y.start = yinit1, y.bound = ybounds, y.num.steps = ystepnumber)
# Visualize the quasi-potential
QPContour(storage.eq1, dens = c(xstepnumber, ystepnumber), 
	x.bound = xbounds, y.bound = ybounds, c.parm = 5) 



