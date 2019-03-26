library(assist)


### Name: plot.bCI
### Title: Bayesian Confidence Interval Plot of a Smoothing Spline Fit
### Aliases: plot.bCI
### Keywords: file

### ** Examples

x<- seq(0, 1, len=100)
y<- 2*sin(2*pi*x)+rnorm(x)*0.5

fit<- ssr(y~x, cubic(x))
p.fit<- predict(fit)
## Not run: plot(p.fit)
## Not run: plot(p.fit,type.name="fit")



