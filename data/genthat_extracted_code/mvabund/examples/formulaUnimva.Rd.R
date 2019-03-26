library(mvabund)


### Name: formulaUnimva
### Title: Create a List of Univariate Formulas
### Aliases: formulaUnimva
### Keywords: models multivariate manip

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

formulaUnimva(spiddat~X)



