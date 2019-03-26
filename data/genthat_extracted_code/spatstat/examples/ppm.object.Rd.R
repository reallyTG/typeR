library(spatstat)


### Name: ppm.object
### Title: Class of Fitted Point Process Models
### Aliases: ppm.object methods.ppm
### Keywords: spatial attribute

### ** Examples

  data(cells)
  fit <- ppm(cells, ~ x, Strauss(0.1), correction="periodic")
  fit
  coef(fit)
  ## Not run: 
##D   pred <- predict(fit)
##D   
## End(Not run)
  pred <- predict(fit, ngrid=20, type="trend")
  ## Not run: 
##D   plot(fit)
##D   
## End(Not run)  



