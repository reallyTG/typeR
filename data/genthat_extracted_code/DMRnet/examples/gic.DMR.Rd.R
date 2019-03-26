library(DMRnet)


### Name: gic.DMR
### Title: gic.DMR
### Aliases: gic.DMR

### ** Examples

data(miete)
y <- miete[,1]
X <- miete[,-1]
m <- DMR(X, y)
(g <- gic.DMR(m, c = 2.5))



