library(RSpincalc)


### Name: isPureRotationMatrix
### Title: Determine if the variable is a pure rotation matrix
### Aliases: isPureRotationMatrix isPureQuaternion isRealQuaternion
###   isUnitQuaternion
### Keywords: programming

### ** Examples

isPureRotationMatrix(matrix(rep(0,9),3,3,byrow=TRUE),.1)
isPureRotationMatrix(matrix(rep(1,9),3,3,byrow=TRUE),.1)
isPureRotationMatrix(matrix(c(0,0,-1,0,1,0,1,0,1),3,3,byrow=TRUE),.1)
DCMx10 <- DCMrandom(10)
isPureRotationMatrix(DCMx10)



