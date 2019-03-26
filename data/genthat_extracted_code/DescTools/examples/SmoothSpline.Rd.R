library(DescTools)


### Name: SmoothSpline
### Title: Formula Interface For 'smooth.spline'
### Aliases: SmoothSpline SmoothSpline.formula SmoothSpline.default
### Keywords: smooth

### ** Examples

plot(temperature ~ delivery_min, data=d.pizza)
lines(SmoothSpline(temperature ~ delivery_min, data=d.pizza))



