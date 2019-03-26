library(Weighted.Desc.Stat)


### Name: w.plot
### Title: weighted scatter plot
### Aliases: w.plot
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Pearson's Correlation Coefficent
###   Weighted Covariance Weighted Scatter Plot

### ** Examples

n=50
x =  rnorm(n,0,1)
y =  rchisq(n,3)
mu =  runif(n,0,1)
w.plot(x, y, 0.3, mu, lwd=3)

## The function is currently defined as
function(x, y, mu, coef.radii, xlim = NULL, ylim = NULL, lwd = NULL, add = NULL, ...)
	{
		symbols(x, y, mu * coef.radii, inches = FALSE, xlim=xlim, ylim=ylim, lwd=lwd)
	}



