library(Rdistance)


### Name: hazrate.like
### Title: Hazard rate likelihood function for distance analyses
### Aliases: hazrate.like
### Keywords: models

### ** Examples

## Not run: 
##D x <- seq(0, 100, length=100)
##D 
##D # Plots showing effects of changes in sigma
##D plot(x, hazrate.like(c(20, 5), x), type="l", col="red")
##D plot(x, hazrate.like(c(40, 5), x), type="l", col="blue")
##D 
##D # Plots showing effects of changes in beta
##D plot(x, hazrate.like(c(50, 20), x), type="l", col="red")
##D plot(x, hazrate.like(c(50, 2), x), type="l", col="blue")
## End(Not run)
         



