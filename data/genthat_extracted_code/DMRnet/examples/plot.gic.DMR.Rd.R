library(DMRnet)


### Name: plot.gic.DMR
### Title: plot.gic.DMR
### Aliases: plot.gic.DMR

### ** Examples

data(miete)
y <- miete[,1]
X <- miete[,-1]
m <- DMR(X, y)
g <- gic.DMR(m, c = 2.5)
plot(g)



