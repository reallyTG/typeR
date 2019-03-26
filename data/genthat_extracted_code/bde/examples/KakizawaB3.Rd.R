library(bde)


### Name: KakizawaB3
### Title: Class '"KakizawaB3"'
### Aliases: KakizawaB3 KakizawaB3-class
### Keywords: classes

### ** Examples

# create the model 
# we use a MicroBetaChen99Kernel is used as estimator y KakizawaB1 approximation
est <- microBetaChen99Kernel(dataPoints = tuna.r, b = 0.01, modified = FALSE)
model <- kakizawaB3(dataPoints = tuna.r, m = 25, estimator = est)


# examples of usual functions
density(model,0.5)

distribution(model,0.5,discreteApproximation=FALSE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Tuna Data")
lines(model, col="red",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(model, show=TRUE, includePoints=TRUE)



