library(dbmss)


### Name: KdEnvelope
### Title: Estimation of the confidence envelope of the Kd function under
###   its null hypothesis
### Aliases: KdEnvelope

### ** Examples

data(paracou16)
plot(paracou16[paracou16$marks$PointType=="Q. Rosea"])

# Calculate confidence envelope
plot(KdEnvelope(paracou16, , ReferenceType="Q. Rosea", Global=TRUE))

# Center of the confidence interval
Kdhat(paracou16, ReferenceType="") -> kd
lines(kd$Kd ~ kd$r, lty=3, col="green")



