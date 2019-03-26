library(OptimalDesign)


### Name: od.AA
### Title: Optimal approximate size-constrained design
### Aliases: od.AA

### ** Examples

# Create the regressors matrix for the third-degree trigonometric model 
# on a "partial circle".
F.trig <- F.cube(~I(cos(x1)) + I(sin(x1)) + 
          I(cos(2 * x1)) + I(sin(2 * x1)) + 
          I(cos(3 * x1)) + I(sin(3 * x1)), 
          -pi/2, pi/2, 200)

# Compute the D-, A-, and IV-optimal standardized approximate designs.
res.trig.D <- od.AA(F.trig, 1, alg = "doom", crit = "D", 
              graph=1:7, t.max=4)
res.trig.A <- od.AA(F.trig, 1, alg = "doom", crit = "A", 
              graph=1:7, t.max=4)
res.trig.IV <- od.AA(F.trig, 1, alg = "doom", crit = "IV", 
               graph=1:7, t.max=4)

# Create a model with 2000 regressors generated from the 5 dimensional 
# multivariate normal distribution. (A random linear regression model 
# with 2000 design points and 5 parameters.)
F.norm <- matrix(rnorm(10000), ncol=5)

# Compute the D-, and A-optimal standardized approximate designs. 
res.norm.D <- od.AA(F.norm, 1, alg = "om", crit = "D", 
                    graph=1:5, t.max=4)
res.norm.A <- od.AA(F.norm, 1, alg = "om", crit = "A", 
                    graph=1:5, t.max=4)



