library(hetGP)


### Name: rebuild
### Title: Import and export of hetGP objects
### Aliases: rebuild rebuild.homGP strip rebuild.hetGP rebuild.homTP
###   rebuild.hetTP

### ** Examples

set.seed(32)
## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
## Model fitting
model <- mleHetGP(X = X, Z = Z, lower = 0.1, upper = 50)

# Check size
object.size(model)

# Remove internal elements, e.g., to save it
model <- strip(model)

# Check new size
object.size(model)

# Now rebuild model, and use ginv instead
model <- rebuild(model, robust = TRUE)
object.size(model)




