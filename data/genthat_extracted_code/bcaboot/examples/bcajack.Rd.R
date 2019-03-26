library(bcaboot)


### Name: bcajack
### Title: Nonparametric bias-corrected and accelerated bootstrap
###   confidence limits
### Aliases: bcajack

### ** Examples

data(diabetes, package = "bcaboot")
Xy <- cbind(diabetes$x, diabetes$y)
rfun <- function(Xy) {
  y <- Xy[, 11]
  X <- Xy[, 1:10]
  summary(lm(y~X) )$adj.r.squared
}
set.seed(1234)
## n = 442 = 34 * 13
bcajack(x = Xy, B = 1000, func = rfun, m = 34, verbose = FALSE)



