library(condvis)


### Name: condvis-package
### Title: Conditional Visualization for Statistical Models
### Aliases: condvis-package condvis
### Keywords: package

### ** Examples

## Not run: 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$am <- as.factor(mtcars$am)
##D 
##D library(mgcv)
##D model1 <- list(
##D   quadratic = lm(mpg ~ cyl + am + qsec + wt + I(wt^2), data = mtcars),
##D   additive = gam(mpg ~ cyl + am + qsec + s(wt), data = mtcars))
##D 
##D ceplot(data = mtcars, model = model1, sectionvars = "wt")
## End(Not run)



