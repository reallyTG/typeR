library(lifecontingencies)


### Name: Exn
### Title: Function to evaluate the pure endowment
### Aliases: Exn

### ** Examples


#assumes SOA example life table to be load
data(soaLt)
soa08Act=with(soaLt, new("actuarialtable",interest=0.06, x=x,lx=Ix,name="SOA2008"))
#evaluate the pure endowment for a man aged 30 for a time span of 35
Exn(soa08Act, x=30, n=35) 



