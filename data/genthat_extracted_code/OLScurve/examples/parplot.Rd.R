library(OLScurve)


### Name: parplot
### Title: Plot distribution of parameters
### Aliases: parplot parplot.OLScurve
### Keywords: OLS, growth

### ** Examples

## Not run: 
##D data <- t(t(matrix(rnorm(1000),200)) + 1:5)
##D group <- rep(c('Male', 'Female'), each=nrow(data)/2)
##D mod <- OLScurve(~ time, data = data)
##D parplot(mod)
##D parplot(mod, type = 'boxplot')
##D parplot(mod, type = 'splom')
##D 
##D parplot(mod, group=group)
##D parplot(mod, type='boxplot', group=group)
##D parplot(mod, type='splom', group=group)
## End(Not run)



