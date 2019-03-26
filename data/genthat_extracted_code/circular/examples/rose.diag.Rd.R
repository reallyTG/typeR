library(circular)


### Name: rose.diag
### Title: Rose Diagram
### Aliases: rose.diag
### Keywords: hplot

### ** Examples


# Generate uniform data and create several rose diagrams.  
# Some optional parameters may be needed to optimize plots.
x <- circular(runif(50, 0, 2*pi))
rose.diag(x, bins = 18, main = 'Uniform Data')
points(x)

# Generate von Mises data and create several rose diagrams.
x <- rvonmises(n=50, mu=circular(0), kappa=5, control.circular=list(zero=pi/4))
y <- rose.diag(x, bins=18) # Points fall out of bounds.
points(x, plot.info=y, stack=TRUE)
y <- rose.diag(x, bins=18, prop=1.5, shrink=1.5) # Adjust optional parameters to fit
######## all points on plot.
points(x, plot.info=y, stack=TRUE)

# Add the rose diag to a plot
plot(x)
rose.diag(x, bins=12, add=TRUE, col=2)



