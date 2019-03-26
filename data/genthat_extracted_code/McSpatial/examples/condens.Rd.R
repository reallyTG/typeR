library(McSpatial)


### Name: condens
### Title: Conditional density estimation
### Aliases: condens
### Keywords: Nonparametric Conditional Density Density Functions

### ** Examples

data(dupage99)
dupage99$ratio <- dupage99$av/dupage99$price
dupage99$price <- dupage99$price/1000
par(ask=TRUE)
fit <- condens(ratio~price,contour=TRUE,level=TRUE,wire=TRUE,dens=TRUE, 
  targetx.dens=seq(100,500,100), data=dupage99)




