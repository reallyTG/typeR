library(ldr)


### Name: screen.pfc
### Title: Adaptive Screening of Predictors
### Aliases: screen.pfc

### ** Examples

data(OH)
X <- OH[, -c(1,295)]; y=OH[,295]

# Correlation screening
out <- screen.pfc(X, fy=bf(y, case="poly", degree=1))
head(out)

# Special basis function
out1 <- screen.pfc(X, fy=scale(cbind(y, sqrt(y)), center=TRUE, scale=FALSE))
head(out1)

# Piecewise constant basis with 10 slices
out2 <- screen.pfc(X, fy=bf(y, case="pdisc", degree=0, nslices=10))
head(out2)



