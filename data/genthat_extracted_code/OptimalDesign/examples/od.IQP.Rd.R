library(OptimalDesign)


### Name: od.IQP
### Title: Efficient exact design using integer quadratic programming
### Aliases: od.IQP

### ** Examples

if(require("gurobi")){
# Consider the full quadratic model on the domain {-1,-0.9,...,0.9,1}^2, 
# that is 2 factors, each with 11 levels -1,-0.9,...,0.9,1. Suppose that 
# the cost of an observation for the combination (i1,i2) of factors is 
# equal to (i1+1.1)+(i2+1.1) price units. Our time and budget constraints 
# dictate that we cannot perform more than 18 observations and spend more
# than 28 price units. Moreover, we do not wish to perform more than one 
# observation under the same combination of factors. Let us compute 
# an IV-efficient design under these constraints.

# Create the matrix of regressors of the model.
F.quad <- F.cube(~x1 + x2 + I(x1^2) + I(x2^2) + I(x1 * x2), 
          c(-1, -1), c(1, 1), c(11, 11))

# Create the matrix A and the vector b such that our constraints on the 
# feasible design w are equivalent to A * w <= b. 
A.quad <- matrix(0, nrow=123, ncol=121)
for (i in 1:121){
  A.quad[1, i] <- 1
  A.quad[2, i] <- sum(F.quad[i, 2:3]) + 2.2
  A.quad[i + 2, i] <- 1
}
b.quad <- c(18, 28, rep(1, 121))

# Compute an IV-efficient design under the constraints defined above.
resIV <- od.IQP(F.quad, b.quad, A.quad, crit="IV", graph = c("x1","x2"), 
                t.max = 60)

# Verify the quality of the resulting design by computing its efficiency 
# with respect to the IV-optimal approximate design.
resIV.approx <- od.IQP(F.quad, b.quad, A.quad, crit="IV")
resIV$Phi.best / resIV.approx$Phi.best
}



