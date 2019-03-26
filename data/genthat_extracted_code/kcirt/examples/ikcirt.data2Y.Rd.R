library(kcirt)


### Name: ikcirt.data2Y
### Title: Convert Rank Data to Y
### Aliases: ikcirt.data2Y
### Keywords: ~kwd1 ~kwd2

### ** Examples


##### here's an itty-bitty example
	
constructMap.ls <- list(
c(1,1,2,2),
c(2,2,3,3),
c(1,1,3,3)
)

qTypes <- rep("M", length(constructMap.ls))

model <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)

#### fake data, two cases (cases run column-wise)
mxData <- t(
rbind(
c( c(1, NA, NA, 4), c(4, NA, NA, 1), c(NA, 4, NA, 1) ),
c( c(1, 4, NA, NA), c(NA, NA, 1, 4), c(NA, 4, 1, NA) )
)
)

ikcirt.data2Y(mxData, mxDelta=model$mxDelta)




