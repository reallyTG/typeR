library(datastepr)


### Name: dataStepClass
### Title: An implementation of a SAS datastep in a class
### Aliases: dataStepClass
### Keywords: datasets

### ** Examples

step = dataStepClass$new()

frame = data.frame(x = 1:10)

stairs = function() {
  step$begin(environment())
  step$set(frame)
  y = x + 1
  step$output()
  step$end(stairs)
}

stairs()

step$results



