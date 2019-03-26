library(PHYLOGR)


### Name: cor.origin
### Title: Correlation Through the Origin
### Aliases: cor.origin
### Keywords: models

### ** Examples

 x <- rnorm(100)
 y <- rnorm(100)
 rho <- cor.origin(x,y)
 rho # the correlation
 2 * (1 - pt(sqrt(99) * rho / sqrt(1 - rho^2), 99))  # the p-value
 



