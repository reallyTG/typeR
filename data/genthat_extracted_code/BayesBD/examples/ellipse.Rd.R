library(BayesBD)


### Name: ellipse
### Title: Generate ellipse boundaries
### Aliases: ellipse

### ** Examples

gamma.fun = ellipse(a = 0.35, b = 0.25)
theta.plot = seq(from = 0, to = 2*pi, length.out = 200)
x = gamma.fun(theta.plot)*cos(theta.plot)
y = gamma.fun(theta.plot)*sin(theta.plot)
plot(x,y,type = 'l', axes=TRUE, frame.plot=FALSE)



