library(DMRnet)


### Name: predict.DMR
### Title: predict.DMR
### Aliases: predict.DMR

### ** Examples

data(miete)
ytr <- miete[1:1500,1]
Xtr <- miete[1:1500,-1]
Xte <- miete[1501:2053,-1]
m <- DMR(Xtr, ytr)
ypr <- predict(m, newx = Xte, df = 11)



