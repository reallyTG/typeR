library(rospca)


### Name: angle
### Title: Standardised last principal angle
### Aliases: angle
### Keywords: algebra

### ** Examples

tmp <- dataGen(m=1)

P <- eigen(tmp$R)$vectors[,1:2]
PP <- rospca(tmp$data[[1]], k=2)$loadings

angle(P, PP)



