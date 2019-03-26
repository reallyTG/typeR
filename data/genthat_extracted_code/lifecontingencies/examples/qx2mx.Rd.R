library(lifecontingencies)


### Name: qx2mx
### Title: Death Probabilities to Mortality Rates
### Aliases: qx2mx

### ** Examples

data(soa08Act)
soa08qx<-as(soa08Act,"numeric")
soa08mx<-qx2mx(qx=soa08qx)
soa08qx2<-mx2qx(soa08mx)



