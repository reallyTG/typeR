library(RcppHMM)


### Name: setNames
### Title: Set the names of the model
### Aliases: setNames
### Keywords: methods

### ** Examples

## Values for a hidden Markov model with categorical observations

set.seed(1000)
newModel <- initHMM(2,4)
n <- c("First","Second")
m <- c("A","T","C","G")
newModel <- setNames(newModel,
                    list( "StateNames" = n,
                          "ObservationNames" = m) )

## Values for a hidden Markov model with continuous observations

set.seed(1000)
newModel <- initGHMM(3) 
n <- c("Low",  "Normal", "High" )
newModel <- setNames(newModel,
                     list( "StateNames" = n))

## Values for a hidden Markov model with discrete observations

set.seed(1000)
newModel <- initPHMM(3) 
n <- c("Low",  "Normal", "High" )
newModel <- setNames(newModel,
                     list( "StateNames" = n))




