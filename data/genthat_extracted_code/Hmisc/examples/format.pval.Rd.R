library(Hmisc)


### Name: format.pval
### Title: Format P Values
### Aliases: format.pval
### Keywords: print

### ** Examples

format.pval(c(runif(5), pi^-100, NA))
format.pval(c(0.1, 0.0001, 1e-27))
format.pval(c(0.1, 1e-27), nsmall=3)



