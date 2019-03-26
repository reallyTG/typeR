library(rockchalk)


### Name: summarizeFactors
### Title: Extracts non-numeric variables, calculates summary information,
###   including entropy as a diversity indicator.
### Aliases: summarizeFactors

### ** Examples

set.seed(21234)
x <- runif(1000)
xn <- ifelse(x < 0.2, 0, ifelse(x < 0.6, 1, 2))
xf <- factor(xn, levels=c(0,1,2), labels("A","B","C"))
dat <- data.frame(xf, xn, x)
summarizeFactors(dat)
##see help for summarize for more examples



