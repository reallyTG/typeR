library(amap)


### Name: acp
### Title: Principal component analysis
### Aliases: acp pca print.acp
### Keywords: multivariate

### ** Examples

data(lubisch)
lubisch <- lubisch[,-c(1,8)]
p <- acp(lubisch)
plot(p)



