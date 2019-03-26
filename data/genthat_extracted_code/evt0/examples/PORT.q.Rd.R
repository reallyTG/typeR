library(evt0)


### Name: PORT.q
### Title: Peaks over random threshold high quantile estimate
### Aliases: PORT.q
### Keywords: quasi-reduced bias PORT Hill VaR

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate PORT Hill and quantile at level q2
PORT.q(x,c(1,500,5000),0.1,0.5,"PRBMOP")



