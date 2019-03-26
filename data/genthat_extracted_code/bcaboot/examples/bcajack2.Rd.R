library(bcaboot)


### Name: bcajack2
### Title: Nonparametric bias-corrected and accelerated bootstrap
###   confidence limits
### Aliases: bcajack2

### ** Examples

data(diabetes, package = "bcaboot")
Xy <- cbind(diabetes$x, diabetes$y)
rfun <- function(Xy) {
  y <- Xy[, 11]
  X <- Xy[, 1:10]
  summary(lm(y~X) )$adj.r.squared
}
set.seed(1234)
bcajack2(x = Xy, B = 1000, func = rfun, m = 40, verbose = FALSE)




