library(Rdimtools)


### Name: do.ldp
### Title: Locally Discriminating Projection
### Aliases: do.ldp

### ** Examples

## generate data of 3 types with clear difference
dt1  = aux.gensamples(n=33)-100
dt2  = aux.gensamples(n=33)
dt3  = aux.gensamples(n=33)+100

## merge the data and create a label correspondingly
X      = rbind(dt1,dt2,dt3)
label  = c(rep(1,33), rep(2,33), rep(3,33))

## try different neighborhood sizes
out1 = do.ldp(X, label, type=c("proportion",0.01))
out2 = do.ldp(X, label, type=c("proportion",0.05))
out3 = do.ldp(X, label, type=c("proportion",0.10))

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="1% connectivity")
plot(out2$Y[,1], out2$Y[,2], main="5% connectivity")
plot(out3$Y[,1], out3$Y[,2], main="10% connectivity")




