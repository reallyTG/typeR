library(reporttools)


### Name: formatPval
### Title: Format P Values
### Aliases: formatPval
### Keywords: print

### ** Examples

## include equality signs?
formatPval(c(stats::runif(5), pi^-100, NA))
formatPval(c(stats::runif(5), pi^-100, NA), include=TRUE)

## try another eps argument
formatPval(c(0.1, 0.0001, 1e-7))
formatPval(c(0.1, 0.0001, 1e-7), eps=1e-7)

## only the white space can differ with the base function result:
(a <- formatPval(c(0.1, 0.0001, 1e-27),
                 eps = .Machine$double.eps, scientific = TRUE))
(b <- format.pval(c(0.1, 0.0001, 1e-27)))
all.equal(a, b)



