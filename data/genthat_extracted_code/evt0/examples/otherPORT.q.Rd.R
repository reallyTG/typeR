library(evt0)


### Name: otherPORT.q
### Title: Other peaks over random threshold high quantile estimate
### Aliases: otherPORT.q
### Keywords: PORT moment generalized Hill mixed moment VaR

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate PORT EVI and high quantile at level q2
otherPORT.q(x,c(500,5000),0.1,0.5,"MO")



