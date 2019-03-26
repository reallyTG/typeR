library(mvst)


### Name: bivPlot
### Title: Marginal and joint plots for bivariate data.
### Aliases: bivPlot

### ** Examples

# Define the parameters' list
pars = list(xi=c(5,2), G=diag(2), psi=rep(1,2), nu=4)
# Generate data
values = rmvSE(200, 2, NULL, 'ST', theta=pars)
y = values$y
# Draw the data points.
bivPlot(y)
# Draw the data points and the density function.
bivPlot(y, modelType='ST', theta=pars)



