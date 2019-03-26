library(circular)


### Name: points.circular
### Title: Add Points to a Circular Plot
### Aliases: points.circular
### Keywords: hplot

### ** Examples

data.1 <- rvonmises(n=100, mu=circular(0), kappa=3)
data.2 <- rvonmises(n=100, mu=circular(pi/3), kappa=3) 
res <- plot(data.1, stack=FALSE, col=1) 
points(data.2, plot.info=res, col=2)



