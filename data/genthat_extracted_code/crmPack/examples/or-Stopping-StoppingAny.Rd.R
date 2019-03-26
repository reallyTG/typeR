library(crmPack)


### Name: or-Stopping-StoppingAny
### Title: The method combining a stopping list and an atomic
### Aliases: or-Stopping-StoppingAny |,StoppingAny,Stopping-method
### Keywords: methods

### ** Examples


## Example of combining a list of stopping rules with an atomic stopping rule
## with an OR ('|') operator

myStopping1 <- StoppingMinCohorts(nCohorts=3)
myStopping2 <- StoppingTargetProb(target=c(0.2, 0.35),
                                  prob=0.5)

myStopping3 <- StoppingMinPatients(nPatients=20)

myStopping <- (myStopping1 & myStopping2 ) | myStopping3 







