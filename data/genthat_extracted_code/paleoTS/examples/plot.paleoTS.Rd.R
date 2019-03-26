library(paleoTS)


### Name: plot.paleoTS
### Title: Plots paleoTS objects
### Aliases: plot.paleoTS
### Keywords: models ts hplot

### ** Examples

y <- sim.GRW(50, 0, 1)
plot(y)
ys <- sub.paleoTS(y, k=0.2)		# same sequence, sub-sampled
plot (ys, add=TRUE, col="red")



