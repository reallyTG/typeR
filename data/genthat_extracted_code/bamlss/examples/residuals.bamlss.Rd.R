library(bamlss)


### Name: residuals.bamlss
### Title: Compute BAMLSS Residuals
### Aliases: residuals.bamlss plot.bamlss.residuals
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Generate data.
##D d <- GAMart()
##D 
##D ## Estimate models.
##D b1 <- bamlss(num ~ s(x1), data = d)
##D b2 <- bamlss(num ~ s(x1) + s(x2) + s(x3), data = d)
##D 
##D ## Extract quantile residuals.
##D e1 <- residuals(b1, type = "quantile")
##D e2 <- residuals(b2, type = "quantile")
##D 
##D ## Plots.
##D plot(e1)
##D plot(e2)
## End(Not run)



