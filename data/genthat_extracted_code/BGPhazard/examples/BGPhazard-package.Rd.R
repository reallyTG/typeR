library(BGPhazard)


### Name: BGPhazard-package
### Title: Markov Beta and Gamma Processes for Modeling Hazard Rates
### Aliases: BGPhazard-package BGPhazard
### Keywords: package

### ** Examples

## The list of active function is {BeMRes, BePlotDiag, BePloth, GaMRes, GaPlotDiag,
## GaPloth, CGaMRes, CGaPlotDiag, CGaPloth, CGaPred, PlotTheta}. The list of data sets
## is {gehan, psych and leukemiaFZ}.

## Simulations may be time intensive. Be patient.

## Example 1
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
#  GaPloth(GEX2, fun = "both", confint = TRUE)

## Example 2
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "control"]
#  deltaG <- gehan$cens[gehan$treat == "control"]
#  BEX2 <- BeMRes(timesG, deltaG, type.c = 2, c.r = rep(50, 22))
#  BePloth(BEX2, confint = TRUE, confidence = 0.95)

## Example 3
#  data(leukemiaFZ)
#  leukemia1 <- leukemiaFZ
#  leukemia1$wbc <- log(leukemiaFZ$wbc)
#  CGEX1 <- CGaMRes(data = leukemia1, K = 10, iterations = 10000, thpar = 10)
#  CGaPloth(CGEX1, fun = "both", confint = TRUE)
#  PlotTheta(CGEX1)

## Example 4. Refer to "Cox-gamma model example" section in package vignette for details.
#  SampWeibull <- function(n, a = 10, b = 1, beta = c(1, 1)) {
#    M <- matrix(0, ncol = 7, nrow = n)
#    for(i in 1:n){
#      M[i, 1] <- i
#      M[i, 2] <- x1 <- runif(1)
#      M[i, 3] <- x2 <- runif(1)
#      M[i, 4] <- rweibull(1, shape = b, 
#                          scale = 1 / (a * exp(cbind(x1, x2) %*% beta)))
#      M[i, 5] <- rexp(1)
#      M[i, 6] <- M[i, 4] > M[i, 5]
#      M[i, 7] <- min(M[i, 4], M[i, 5])
#      }
#    colnames(M) <- c("i", "x_i1", "x_i2", "t_i", "c_i", "delta", "min{c_i, d_i}")
#    return(M)
#  }
#  dat <- SampWeibull(100, 0.1, 1, c(1, 1))
#  dat <- cbind(dat[, c(4, 6)], dat[, c(2, 3)])
#  CG <- CGaMRes(dat, K = 10, iterations = 3000, thpar = 10)
#  CGaPloth(CG)
#  PlotTheta(CG)
#  CGaPred(CG)



