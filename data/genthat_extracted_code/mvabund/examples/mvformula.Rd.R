library(mvabund)


### Name: mvformula
### Title: Model Formulae for Multivariate Abundance Data
### Aliases: mvformula as.mvformula is.mvformula mvformula-class
### Keywords: models multivariate

### ** Examples

require(graphics)

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x
 
## Create a formula for multivariate abundance data:
foo <- mvformula( spiddat~X )

## Check whether foo is a mvformula:
is.mvformula(foo)

## Plot a mvformula:
plot(foo)




