library(spind)


### Name: step.spind
### Title: Stepwise model selection for GEEs and WRMs
### Aliases: step.spind

### ** Examples

# For demonstration only. We are artificially imposing a grid structure
# on data that is not actually spatial data

library(MASS)
data(birthwt)

x <- rep(1:14, 14)
y <- as.integer(gl(14, 14))
coords <- cbind(x[-(190:196)], y[-(190:196)])

## Not run: 
##D formula <- formula(low ~ age + lwt + race + smoke + ftv + bwt)
##D 
##D mgee <- GEE(formula,
##D             family = "gaussian",
##D             data = birthwt,
##D             coord = coords,
##D             corstr = "fixed",
##D             scale.fix = TRUE)
##D 
##D ss <- step.spind(mgee, birthwt)
##D 
##D best.mgee <- GEE(ss$model,
##D                  family = "gaussian",
##D                  data = birthwt,
##D                  coord = coords,
##D                  corstr = "fixed",
##D                  scale.fix = TRUE)
##D 
##D summary(best.mgee, printAutoCorPars = FALSE)
## End(Not run)




