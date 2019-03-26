library(intamap)


### Name: yamamotoKrige
### Title: kriging and simulation with alternative kriging variance
### Aliases: yamamotoKrige
### Keywords: spatial

### ** Examples

library(gstat)
library(automap)
data(sic2004)
coordinates(sic.val) = ~x+y
coordinates(sic.test) = ~x+y
variogramModel = autofitVariogram(joker~1,sic.val)$var_model
newData = yamamotoKrige(joker~1,sic.val,sic.test,variogramModel,nmax = 20)
summary(newData)
plot(sqrt(var1.ok)~var1.pred,newData) 
# Kriging variance the same in regions with extreme values
plot(sqrt(var1.var)~var1.pred,newData) 
# Kriging standard deviation higher for high predictions (close to extreme values)



