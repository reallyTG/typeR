library(sysid)


### Name: idframe
### Title: S3 class for storing input-output data.
### Aliases: idframe

### ** Examples


dataMatrix <- matrix(rnorm(1000),ncol=5) 
data <- idframe(output=dataMatrix[,3:5],input=dataMatrix[,1:2],Ts=1)




