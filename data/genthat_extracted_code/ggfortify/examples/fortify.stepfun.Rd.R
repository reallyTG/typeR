library(ggfortify)


### Name: fortify.stepfun
### Title: Convert 'stats::stepfun' to 'data.frame'
### Aliases: fortify.stepfun

### ** Examples

fortify(stepfun(c(1, 2, 3), c(4, 5, 6, 7)))
fortify(stepfun(c(1), c(4, 5)))
fortify(stepfun(c(1, 3, 4, 8), c(4, 5, 2, 3, 5)))
fortify(stepfun(c(1, 2, 3, 4, 5, 6, 7, 8, 10), c(4, 5, 6, 7, 8, 9, 10, 11, 12, 9)))



