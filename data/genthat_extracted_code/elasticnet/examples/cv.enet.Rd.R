library(elasticnet)


### Name: cv.enet
### Title: Computes K-fold cross-validated error curve for elastic net
### Aliases: cv.enet
### Keywords: regression

### ** Examples

data(diabetes)
attach(diabetes)
## use the L1 fraction norm as the tuning parameter
cv.enet(x2,y,lambda=0.05,s=seq(0,1,length=100),mode="fraction",trace=TRUE,max.steps=80)
## use the number of steps as the tuning parameter
cv.enet(x2,y,lambda=0.05,s=1:50,mode="step")
detach(diabetes)



