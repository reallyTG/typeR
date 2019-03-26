library(forecTheta)


### Name: Plot
### Title: Plot forecasts points and prediction intervals for 'thetaModel'
###   objects
### Aliases: plot.thetaModel
### Keywords: plot

### ** Examples

y1 = 2+ 0.15*(1:20) + rnorm(20,2)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30,2)
y =  as.ts(c(y1,y2))
out <- dotm(y, h=10)
plot(out)



