library(ks)


### Name: kms
### Title: Kernel mean shift clustering
### Aliases: kms summary.kms
### Keywords: cluster

### ** Examples

library(MASS)
data(crabs)
kms.crabs <- kms(x=crabs[,c("FL", "CW")])
plot(kms.crabs$x, col=kms.crabs$label)
summary(kms.crabs)



