library(spsurvey)


### Name: cdf.test
### Title: Cumulative Distribution Function - Inference
### Aliases: cdf.test
### Keywords: survey distribution

### ** Examples

n <- 100
resp <- rnorm(n, 10, 1)
wgt <- runif(n, 10, 100)
sample1 <- list(z=resp, wgt=wgt)
sample2 <- list(z=resp+0.5, wgt=wgt)
bounds <- sort(c(sample1$z, sample2$z))[floor(seq((2*n)/3, (2*n),
  length=3))]
cdf.test(bounds=bounds, z_1=sample1$z, wgt_1=sample1$wgt, z_2=sample2$z,
   wgt_2=sample2$wgt, vartype_1="SRS", vartype_2="SRS")

xcoord <- runif(n)
ycoord <- runif(n)
sample1 <- list(z=resp, wgt=wgt, x=xcoord, y=ycoord)
sample2 <- list(z=1.05*resp, wgt=wgt, x=xcoord, y=ycoord)
cdf.test(bounds=bounds, z_1=sample1$z, wgt_1=sample1$wgt, x_1=sample1$x,
  y_1=sample1$y, z_2=sample2$z, wgt_2=sample2$wgt, x_2=sample2$x,
  y_2=sample2$y)



