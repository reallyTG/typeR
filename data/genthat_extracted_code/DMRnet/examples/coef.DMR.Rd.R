library(DMRnet)


### Name: coef.DMR
### Title: coef.DMR
### Aliases: coef.DMR

### ** Examples

data(miete)
y <- miete[,1]
X <- miete[,-1]
m <- DMR(X, y)
coef(m, df = 12)



