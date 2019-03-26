library(BayesBD)


### Name: triangle2
### Title: Generate triangle boundaries
### Aliases: triangle2

### ** Examples

gamma.fun = triangle2(0.5)
theta.plot = seq(from = 0, to = 2*pi, length.out = 200)
x = gamma.fun(theta.plot)*cos(theta.plot)
y = gamma.fun(theta.plot)*sin(theta.plot)
plot(x,y,type = 'l', axes=TRUE, frame.plot=FALSE)



