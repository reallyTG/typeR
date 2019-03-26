library(x12)


### Name: prev-methods
### Title: ~~ Methods for Function 'prev' and 'cleanArchive' in Package
###   'x12' ~~
### Aliases: prev prev-methods prev,x12Batch-method prev,x12Single-method
###   cleanHistory cleanHistory-methods cleanHistory,x12Batch-method
###   cleanHistory,x12Single-method cleanArchive cleanArchive-methods
###   cleanArchive,x12Batch-method cleanArchive,x12Single-method
### Keywords: methods ~~ other possible keyword(s) ~~

### ** Examples

data(AirPassengersX12)
summary(AirPassengersX12)
# a maximum of 10 previous x12 runs are added to the summary
summary(AirPassengersX12,oldOutput=10)
#the x12Parameter and x12Output of the x12Single is set to the previous run of x12
Ap=prev(AirPassengersX12)
summary(AirPassengersX12,oldOutput=10)



