library(OptimalDesign)


### Name: od.SOCP
### Title: Optimal approximate design using second-order cone programming
### Aliases: od.SOCP

### ** Examples

if(require("gurobi")){
# Suppose that we model the mean values of the observations of 
# a circadian rhythm by a third-degree trigonometric model on 
# a discretization of the interval [0, 2*pi]. We would like to 
# construct a D-efficient design. 
# However, the distance of successive times of observations should not be 
# smaller than the (1/72)-th of the interval (20 minutes, if the interval 
# represents one day). Also, we cannot perform more than 8 observations
# in total, and more than 4 observations in the interval [2*pi/3, 2*pi] 
# (i.e., during the 16 non-working hours).

# Create the matrix of regressors. 
F.trig <- F.cube(~I(cos(x1)) + I(sin(x1)) + 
          I(cos(2 * x1)) + I(sin(2 * x1)) +
          I(cos(3 * x1)) + I(sin(3 * x1)), 
          1 / 144, 2 * pi, 288) 

# Create the constraints.
b.trig <- c(rep(1, 285), 12, 4)
A.trig <- matrix(0, nrow=287, ncol=288)
for(i in 1:285) A.trig[i, i:(i+3)] <- 1  
A.trig[286,] <- 1; A.trig[287, 97:288] <- 1

# Compute the D-optimal approximate design under the constraints.
res.trig <- od.SOCP(F.trig, b.trig, A.trig, crit="D")

# Inspect the resulting approximate design.
od.plot(res.trig$w.best)
od.print(round(res.trig$w.best,2))

# It is clear that a very efficient exact design of size 8 satisfying 
# the constraints performs the observations in design points 
# 1, 34, 63, 96, 134, 173, 212, 251, i.e.
w.exact <- rep(0, 288)
w.exact[c(1, 34, 63, 96, 134, 173, 212, 251)] <- 1

# Indeed, the efficiency of this exact design relative to the optimal 
# approximate design is:
od.crit(F.trig, w.exact) / od.crit(F.trig, res.trig$w.best)

# Of course, it is also possible to directly use an exact-design function 
# such as od.MISOCP for this problem, or it is possible to use 
# the optimal approximate design to decrease the support size of 
# the candidate design points set, and then use an exact-design 
# procedure.

# See also the examples in the help files of functions od.RC, od.IQP 
# and od.MISOCP, where od.SOCP is used to compute informative lower 
# bounds on the efficiencies of exact designs.
}



