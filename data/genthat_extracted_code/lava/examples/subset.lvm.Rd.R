library(lava)


### Name: subset.lvm
### Title: Extract subset of latent variable model
### Aliases: subset.lvm measurement
### Keywords: models regression

### ** Examples


m <- lvm(c(y1,y2)~x1+x2)
subset(m,~y1+x1)




