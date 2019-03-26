library(OptimalDesign)


### Name: od.KL
### Title: Efficient exact size-constrained design using the KL exchange
###   heuristic
### Aliases: od.KL

### ** Examples

# Consider the quadratic Scheffe mixture model with 3 mixture components, 
# each one with permissible levels 0,0.02,...,0.7, i.e., without high 
# proportions of components.
# We will calculate an A-efficient exact design of size 18.

# Compute the regressors for the mixture model without constraints 
# on the region.
# (Note: Here, the constraints are on the design region; it is generally 
# much simpler to  find an optimal design under non-standard constraints 
# on the design region than find an optimal design under non-standard 
# constraints on the design itself.)
F.scheffe <- F.simplex(~x1 + x2 + x3 + I(x1 * x2) + I(x1 * x3) + 
             I(x2 * x3) - 1, 3, 51)

# Remove the trials with high values of the mixture components.
# The resulting design space will have 966 design points.
F.scheffe <- F.scheffe[apply(F.scheffe[, 1:3], 1, max) <= 0.7,]

# Compute an A-efficient exact designs with 18 observations.
res.exact <- od.KL(F.scheffe, 18, crit = "A", tab=1:3, 
                   graph=1:3, t.max=4)

# Verify the quality of the resulting design by computing its efficiency 
# relative to the A-optimal approximate size-constrained design.
res.approx <- od.AA(F.scheffe, 18, crit = "A", eff=1-1e-9)
res.exact$Phi.best / res.approx$Phi.best



