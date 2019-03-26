library(gaston)


### Name: qqplot.pvalues
### Title: QQ plot of p-values
### Aliases: qqplot.pvalues

### ** Examples

# a vector of uniform p-values
p <- runif(1e6)
qqplot.pvalues(p)
# if we don't thin the points, using pch = "." is advised
qqplot.pvalues(p, pch = ".", cex = 2, thinning = FALSE)



