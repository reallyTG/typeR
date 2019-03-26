library(crmPack)


### Name: or-StoppingAny-Stopping
### Title: The method combining an atomic and a stopping list
### Aliases: or-StoppingAny-Stopping |,Stopping,StoppingAny-method
### Keywords: methods

### ** Examples


## Example of combining an atomic stopping rule with a list of stopping rules
## with an OR ('|') operator

myStopping1 <- StoppingMinCohorts(nCohorts=3)
myStopping2 <- StoppingTargetProb(target=c(0.2, 0.35),
                                  prob=0.5)

myStopping3 <- StoppingMinPatients(nPatients=20)

myStopping <-  myStopping3 | (myStopping1 & myStopping2 ) 







