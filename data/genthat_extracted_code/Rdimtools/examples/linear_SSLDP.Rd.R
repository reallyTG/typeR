library(Rdimtools)


### Name: do.ssldp
### Title: Semi-Supervised Locally Discriminant Projection
### Aliases: do.ssldp

### ** Examples

## generate data of 3 types with clear difference
dt1  = aux.gensamples(n=33)-100
dt2  = aux.gensamples(n=33)
dt3  = aux.gensamples(n=33)+100

## merge the data and create a label correspondingly
Z      = rbind(dt1,dt2,dt3)
label  = c(rep(1,33), rep(2,33), rep(3,33))

## copy a label and let 10% of elements be missing
nlabel = length(label)
nmissing = round(nlabel*0.10)
label_missing = label
label_missing[sample(1:nlabel, nmissing)]=NA

## compute with 3 different neighborhood size
out1 = do.ssldp(Z, label_missing, type=c("proportion",0.05))
out2 = do.ssldp(Z, label_missing, type=c("proportion",0.10))
out3 = do.ssldp(Z, label_missing, type=c("proportion",0.25))

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="5% connectivity")
plot(out2$Y[,1], out2$Y[,2], main="10% connectivity")
plot(out3$Y[,1], out3$Y[,2], main="25% connectivity")




