library(pre)


### Name: gpe
### Title: Derive a General Prediction Ensemble (gpe)
### Aliases: gpe

### ** Examples

## Not run: 
##D ## Obtain similar fit to \code{pre}:
##D gpe.rules <- gpe(Ozone ~ ., data = airquality[complete.cases(airquality),], 
##D   base_learners = list(gpe_linear(), gpe_trees()))
##D gpe.rules
##D   
##D ## Also include products of hinge functions using MARS:
##D gpe.hinge <- gpe(Ozone ~ ., data = airquality[complete.cases(airquality),], 
##D   base_learners = list(gpe_linear(), gpe_trees(), gpe_earth()))
## End(Not run)



