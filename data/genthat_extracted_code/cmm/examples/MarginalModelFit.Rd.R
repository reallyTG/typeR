library(cmm)


### Name: MarginalModelFit
### Title: MarginalModelFit
### Aliases: MarginalModelFit
### Keywords: univar

### ** Examples

# see also the built-in data sets

data(NKPS)

# Fit the model asserting Goodman and Kruskal's gamma is zero for
# Child's attitude toward sex role's (NKPS[,3], three categories) and
# parent's attitude toward sex role's (NKPS[,4], three categories).

coeff = SpecifyCoefficient("GoodmanKruskalGamma",c(3,3))
fit = MarginalModelFit(NKPS[,c(3,4)], coeff )


# Marginal homogeneity (MH) in a 3x3 table AB
# Note that MH is equivalent to independence in the 2x3 table of marginals IR, in which 
# the row with I=1 gives the A marginal, and the row with I=2 gives the B marginal 
n <- c(1,2,3,4,5,6,7,8,9)
at <- MarginalMatrix(c("A","B"),list(c("A"),c("B")),c(3,3))
bt <- ConstraintMatrix(c("I","R"),list(c("I"),c("R")),c(2,3))
model <- list( bt, "log", at)
fit <- MarginalModelFit(n,model)

#Output can be tidied up:
fit <- MarginalModelFit(n,model,CoefficientDimensions=c(2,3))



