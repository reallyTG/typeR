library(DMRnet)


### Name: coef.gic.DMR
### Title: coef.gic.DMR
### Aliases: coef.gic.DMR

### ** Examples

data(miete)
y <- miete[,1]
X <- miete[,-1]
m <- DMR(X, y)
g <- gic.DMR(m, c = 2.5)
coef(g)



