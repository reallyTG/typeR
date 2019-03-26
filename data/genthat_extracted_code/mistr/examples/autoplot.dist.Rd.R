library(mistr)


### Name: autoplot.dist
### Title: Autoplot of Distributions Using ggplot2
### Aliases: autoplot.dist

### ** Examples

## Not run: 
##D N <- normdist()
##D autoplot(N)
##D 
##D # manipulating cdf plot
##D B <- binomdist(12, 0.5)
##D autoplot(-3*B, which = "cdf", xlim1 = c(-30, -10))
##D # manipulating pdf plot
##D autoplot(-3*B, which = "pdf", xlim2 = c(-30, -10))
## End(Not run)



