library(gamlss.dist)


### Name: DPO
### Title: The Double Poisson distribution
### Aliases: DPO pDPO dDPO qDPO rDPO get_C
### Keywords: distribution regression

### ** Examples

DPO()
# overdisperse DPO
x <- 0:20
plot(x, dDPO(x, mu=5, sigma=3), type="h", col="red")
# underdisperse DPO
plot(x, dDPO(x, mu=5, sigma=.3), type="h", col="red")
# generate random sample
 Y <- rDPO(100,5,.5)
plot(table(Y))
points(0:20, 100*dDPO(0:20, mu=5, sigma=.5)+0.2,  col="red")
# fit a model to the data 
# library(gamlss)
# gamlss(Y~1,family=DPO)



