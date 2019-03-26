library(metaplot)


### Name: multiplot
### Title: Arrange Multiple Trellis or GG Plots in a Grid
### Aliases: multiplot

### ** Examples

library(lattice)
a <- xyplot(
conc ~ Time,
xlab=NULL,
ylab = NULL,
Theoph,
aspect = 1,
scales=list(draw=FALSE)
)
multiplot(a,a,a,a,a,a)
multiplot(a,a,a,a,a,a,a)
multiplot(a,a,a,a,a,a,a,a)
multiplot(a,a,a,a,a,a,a,a,a)
multiplot(a,a,a,a,a,a,a,a,a,a)
multiplot(a,a,a,a,a,a,a,a, nrow = 2)
multiplot(a,a,a,a,a,a,a,a, ncol = 4)
multiplot(a,a,a,a,a,a,a,a, ncol = 2)
multiplot(a,a,a,a,a,a,a,a, ncol = 4, nrow = 3)
multiplot(multiplot(a,a), a)



