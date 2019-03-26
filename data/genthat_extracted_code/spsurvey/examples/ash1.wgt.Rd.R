library(spsurvey)


### Name: ash1.wgt
### Title: Compute the Average Shifted Histogram for Weighted Data
### Aliases: ash1.wgt
### Keywords: survey misc

### ** Examples

x <- rnorm(100, 10, sqrt(10))
wgt <- runif(100, 10, 100)
rslt <- ash1.wgt(x, wgt)
plot(rslt)



