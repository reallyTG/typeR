library(QPot)


### Name: VecDecomVec
### Title: Vector decomposition and remainder fields
### Aliases: VecDecomVec

### ** Examples

# First, the system of equations
	equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0+x*x)"
	equationy <- "((0.476*x*x*y)/(1+x*x)) - 0.112590*y*y"

# Second, shared parameters for each quasi-potential run
	xbounds <- c(-0.5, 20.0)
	ybounds <- c(-0.5, 20.0)
	xstepnumber <- 1000
	ystepnumber <- 1000

# Third, create the deterministic skeleton vector field
	VDV <- VecDecomVec(x.num.steps = xstepnumber, y.num.steps = ystepnumber, x.rhs = equationx, 
	y.rhs = equationy, x.bound = xbounds, y.bound = ybounds)



