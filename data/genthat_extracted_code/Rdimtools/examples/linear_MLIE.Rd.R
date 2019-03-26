library(Rdimtools)


### Name: do.mlie
### Title: Maximal Local Interclass Embedding
### Aliases: do.mlie

### ** Examples

## generate data of 3 types with clear difference
dt1  = aux.gensamples(n=33)-100
dt2  = aux.gensamples(n=33)
dt3  = aux.gensamples(n=33)+100

## merge the data and create a label correspondingly
X      = rbind(dt1,dt2,dt3)
label  = c(rep(1,33), rep(2,33), rep(3,33))

## try different numbers for neighborhood size
out1 = do.mlie(X, label, k1=5, k2=5)
out2 = do.mlie(X, label, k1=10,k2=10)
out3 = do.mlie(X, label, k1=25,k2=25)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="MLIE::nbd size=5")
plot(out2$Y[,1], out2$Y[,2], main="MLIE::nbd size=10")
plot(out3$Y[,1], out3$Y[,2], main="MLIE::nbd size=25")




