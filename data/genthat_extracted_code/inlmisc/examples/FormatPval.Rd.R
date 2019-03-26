library(inlmisc)


### Name: FormatPval
### Title: Format P Values
### Aliases: FormatPval
### Keywords: utilities

### ** Examples

x <- c(stats::runif(5), pi^-100, NA)
FormatPval(x)
format.pval(x)

x <- c(0.1, 0.0001, 1e-27)
FormatPval(x, scientific = TRUE)
FormatPval(x, digits = 3, eps = 0.001)




