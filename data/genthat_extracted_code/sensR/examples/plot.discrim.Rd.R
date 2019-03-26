library(sensR)


### Name: plot.discrim
### Title: Plot function for discrim objects
### Aliases: plot.discrim
### Keywords: hplot

### ** Examples

## Generate discrim objects to be plotted:
fm1 <- discrim(10, 15, method = "threeAFC")
fm2 <- discrim(10, 15, method = "triangle")
par(mfrow=c(2,1)) ## Split plotting window in two
## Plot the distributions of sensory intensity for the two objects
## and increase the line width
plot(fm1, lwd=2) 
plot(fm2, lwd=2)



