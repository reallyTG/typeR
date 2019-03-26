library(geometa)


### Name: ISOStandardOrderProcess
### Title: ISOStandardOrderProcess
### Aliases: ISOStandardOrderProcess
### Keywords: ISO StandardOrderProcess

### ** Examples

  md <- ISOStandardOrderProcess$new()
  md$setFees("fees")
  md$setPlannedAvailableDateTime(ISOdate(2017,7,5,12,0,0))
  md$setOrderingInstructions("instructions")
  md$setTurnaround("turnaround")
  xml <- md$encode()




