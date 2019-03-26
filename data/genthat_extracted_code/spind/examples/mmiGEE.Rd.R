library(spind)


### Name: mmiGEE
### Title: Multi-model inference for GEE models
### Aliases: mmiGEE

### ** Examples

# data (for demonstration only)
library(MASS)
data(birthwt)

# impose an artificial (not fully appropriate) grid structure

x <- rep(1:14, 14)
y <- as.integer(gl(14, 14))
coords <- cbind(x[-(190:196)], y[-(190:196)])

## Not run: 
##D 
##D formula <- formula(low ~ race + smoke +  bwt)
##D 
##D mgee <- GEE(formula,
##D             family = "gaussian",
##D             data = birthwt,
##D             coord = coords,
##D             corstr = "fixed",
##D             scale.fix = TRUE)
##D 
##D mmi <- mmiGEE(mgee, birthwt)
##D 
## End(Not run)



