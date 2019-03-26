library(bamlss)


### Name: model.frame.bamlss
### Title: BAMLSS Model Frame
### Aliases: model.frame.bamlss model.frame.bamlss.frame bamlss.model.frame
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   log(pnum) ~ s(x1) + log(x2),
##D   sigma ~ s(x3)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Extract the model frame.
##D head(model.frame(b))
## End(Not run)



