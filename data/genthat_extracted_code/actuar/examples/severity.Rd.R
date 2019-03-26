library(actuar)


### Name: severity
### Title: Manipulation of Individual Claim Amounts
### Aliases: severity severity.default
### Keywords: datagen manip

### ** Examples

x <- list(c(1:3), c(1:8), c(1:4), c(1:3))
(mat <- matrix(x, 2, 2))
severity(mat)
severity(mat, bycol = TRUE)



