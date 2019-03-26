library(Rdimtools)


### Name: do.ksda
### Title: Kernel Semi-Supervised Discriminant Analysis
### Aliases: do.ksda

### ** Examples

## generate data of 3 types with clear difference
dt1  = aux.gensamples(n=33)-100
dt2  = aux.gensamples(n=33)
dt3  = aux.gensamples(n=33)+100

## merge the data and create a label correspondingly
Y      = rbind(dt1,dt2,dt3)
label  = c(rep(1,33), rep(2,33), rep(3,33))

## copy a label and let 10% of elements be missing
nlabel = length(label)
nmissing = round(nlabel*0.10)
label_missing = label
label_missing[sample(1:nlabel, nmissing)]=NA

## compare true case with missing-label case
out1 = do.ksda(Y, label, beta=0, t=0.1)
out2 = do.ksda(Y, label_missing, beta=0, t=0.1)

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="true projection")
plot(out2$Y[,1], out2$Y[,2], main="20% missing labels")




