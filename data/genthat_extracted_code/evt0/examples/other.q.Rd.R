library(evt0)


### Name: other.q
### Title: Other methods for high quantile estimate
### Aliases: other.q
### Keywords: moment generalized Hill mixed moment VaR

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate EVI and high quantile at level q
other.q(x,c(500,5000,40000),0.5,"MO")



