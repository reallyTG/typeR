library(semTools)


### Name: orthRotate
### Title: Implement orthogonal or oblique rotation
### Aliases: orthRotate oblqRotate funRotate

### ** Examples


## Not run: 
##D 
##D unrotated <- efaUnrotate(HolzingerSwineford1939, nf = 3,
##D                          varList = paste0("x", 1:9), estimator = "mlr")
##D 
##D # Orthogonal varimax
##D out.varimax <- orthRotate(unrotated, method = "varimax")
##D summary(out.varimax, sort = FALSE, suppress = 0.3)
##D 
##D # Orthogonal Quartimin
##D orthRotate(unrotated, method = "quartimin")
##D 
##D # Oblique Quartimin
##D oblqRotate(unrotated, method = "quartimin")
##D 
##D # Geomin
##D oblqRotate(unrotated, method = "geomin")
##D 
##D # Target rotation
##D library(GPArotation)
##D target <- matrix(0, 9, 3)
##D target[1:3, 1] <- NA
##D target[4:6, 2] <- NA
##D target[7:9, 3] <- NA
##D colnames(target) <- c("factor1", "factor2", "factor3")
##D ## This function works with GPArotation version 2012.3-1
##D funRotate(unrotated, fun = "targetQ", Target = target)
## End(Not run)




