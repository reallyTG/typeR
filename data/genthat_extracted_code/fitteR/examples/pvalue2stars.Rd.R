library(fitteR)


### Name: pvalue2stars
### Title: Significance stars
### Aliases: pvalue2stars pvalues2stars pvalues2stars

### ** Examples

x <- runif(1, 0,1)
pvalue2stars(x)

x <- 0.5
pvalue2stars(x, ns="not signif")

x <- c(0.0023, 0.5, 0.04)
pvalues2stars(x, ns="not signif")




