library(VGAM)


### Name: is.parallel
### Title: Parallelism Constraint Matrices
### Aliases: is.parallel is.parallel.matrix is.parallel.vglm
### Keywords: models regression

### ** Examples

## Not run: 
##D  require("VGAMdata")
##D fit <- vglm(educ ~ sm.bs(age) * sex + ethnicity,
##D             cumulative(parallel = TRUE), head(xs.nz, 200))
##D is.parallel(fit)
##D is.parallel(fit, type = "lm")  # For each column of the LM matrix
## End(Not run)



