library(DMRnet)


### Name: predict.gic.DMR
### Title: predict.gic.DMR
### Aliases: predict.gic.DMR

### ** Examples

data(miete)
ytr <- miete[1:1500,1]
Xtr <- miete[1:1500,-1]
Xte <- miete[1501:2053,-1]
m <- DMR(Xtr, ytr)
g <- gic.DMR(m, c = 2.5)
ypr <- predict(g, newx = Xte)



