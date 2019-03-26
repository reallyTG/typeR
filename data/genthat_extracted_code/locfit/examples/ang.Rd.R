library(locfit)


### Name: ang
### Title: Angular Term for a Locfit model.
### Aliases: ang
### Keywords: models

### ** Examples

# generate an x variable, and a response with period 0.2
x <- seq(0,1,length=200)
y <- sin(10*pi*x)+rnorm(200)/5

# compute the periodic local fit. Note the scale argument is period/(2pi)
fit <- locfit(y~ang(x,scale=0.2/(2*pi)))

# plot the fit over a single period
plot(fit)

# plot the fit over the full range of the data
plot(fit,xlim=c(0,1))



