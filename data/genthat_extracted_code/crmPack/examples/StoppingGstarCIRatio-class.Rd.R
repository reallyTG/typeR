library(crmPack)


### Name: StoppingGstarCIRatio-class
### Title: Stop based on a target ratio, the ratio of the upper to the
###   lower 95% credibility interval of the estimate of the minimum of the
###   dose which gives the maximum gain (Gstar) and the TD end of trial,
###   the dose with probability of DLE equals to the target probability of
###   DLE used at the end of a trial.
### Aliases: StoppingGstarCIRatio-class .StoppingGstarCIRatio
### Keywords: classes

### ** Examples

##Define the target stopping ratio of 5 and 
##the target probability of DLE to be used at the end of a trial
##This is a ratio of the upper to the lower 95% credibility interval of the estimates
myStopping <- StoppingGstarCIRatio(targetRatio=5,
                                   targetEndOfTrial=0.3)



