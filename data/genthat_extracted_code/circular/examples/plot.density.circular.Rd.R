library(circular)


### Name: plot.density.circular
### Title: Plot Method for Kernel Density Estimation for Circular Data
### Aliases: plot.density.circular
### Keywords: dplot

### ** Examples


set.seed(1234)
x <- rvonmises(n=100, mu=circular(pi), kappa=2)
res25x <- density(x, bw=25)
plot(res25x, points.plot=TRUE, xlim=c(-1.5,1))
res50x <- density(x, bw=25, adjust=2)
lines(res50x, col=2)

resp25x <- plot(res25x, points.plot=TRUE, xlim=c(-1, 1.3), ylim=c(-1.5,1.2), 
  template="geographics", main="Plotting density estimate for two data set")
y <- rvonmises(n=100, mu=circular(pi/2), kappa=2, 
  control.circular=list(template="geographics"))
res25y <- density(y, bw=25)
lines(res25y, points.plot=TRUE, plot.info=resp25x, col=2, points.col=2)

plot(res25x, plot.type="line", points.plot=TRUE, xlim=c(-1, 1.3), ylim=c(-1.5,1.2), 
  template="geographics", main="Plotting density estimate for two data set")
lines(res25y, plot.type="line", points.plot=TRUE, col=2, points.col=2)




