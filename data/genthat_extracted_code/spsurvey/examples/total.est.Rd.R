library(spsurvey)


### Name: total.est
### Title: Population Total, Mean, Variance, and Standard Deviation
###   Estimates
### Aliases: total.est
### Keywords: survey univar

### ** Examples

z <- rnorm(100, 10, 1)
wgt <- runif(100, 10, 100)
total.est(z, wgt, vartype="SRS")

x <- runif(100)
y <- runif(100)
total.est(z, wgt, x, y)



