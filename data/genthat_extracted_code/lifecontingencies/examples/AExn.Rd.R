library(lifecontingencies)


### Name: AExn
### Title: Function to evaluate the n-year endowment insurance
### Aliases: AExn

### ** Examples

#Actuarial Mathematics book example
#check the actuarial equality on the expected values Exn+Axn=AExn
data(soa08Act)
AExn(soa08Act, x=35,n=30,i=0.06)
Exn(soa08Act, x=35,n=30,i=0.06)+Axn(soa08Act, x=35,n=30,i=0.06)



