library(Rdimtools)


### Name: do.lspp
### Title: Local Similarity Preserving Projection
### Aliases: do.lspp

### ** Examples

## generate data of 2 types with clear difference
diff = 15
dt1  = aux.gensamples(n=123)-diff;
dt2  = aux.gensamples(n=123)+diff;

## merge the data and create a label correspondingly
Y      = rbind(dt1,dt2)
label  = c(rep(1,123), rep(2,123))

## compare with PCA
out1 <- do.pca(Y, ndim=2)
out2 <- do.slpp(Y, label, ndim=2)

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="PCA")
plot(out2$Y[,1], out2$Y[,2], main="LSPP")




