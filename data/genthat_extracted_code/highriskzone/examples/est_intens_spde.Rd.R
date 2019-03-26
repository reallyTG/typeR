library(highriskzone)


### Name: est_intens_spde
### Title: Estimates the intensity of the point pattern by using the SPDE
###   method from r-INLA.
### Aliases: est_intens_spde

### ** Examples

## Not run: 
##D data(craterA)
##D est_spde <- est_intens_spde(coords=craterA)
##D image.plot(list(x=est_spde$intensest$xcol, y=est_spde$intensest$yrow, 
##D                 z=log(t(est_spde$intensest$v))), main="estimated logarithmic intensity")
##D points(craterA)
## End(Not run)



