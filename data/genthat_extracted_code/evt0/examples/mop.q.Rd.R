library(evt0)


### Name: mop.q
### Title: High qunatile estimate by mean of order p statistic
### Aliases: mop.q
### Keywords: MOP EVI reduced-bias Hill VaR

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate EVI and high quantile at level q
mop.q(x,c(1,500,5000,49999), c(-1,0,1),0.5,"RBMOP")




