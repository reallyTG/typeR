library(crmPack)


### Name: StoppingTDCIRatio-class
### Title: Stop based on a target ratio, the ratio of the upper to the
###   lower 95% credibility interval of the estimate of TD end of trial,
###   the dose with probability of DLE equals to the target probability of
###   DLE used at the end of a trial
### Aliases: StoppingTDCIRatio-class .StoppingTDCIRatio
### Keywords: classes

### ** Examples

##Define the target stopping ratio of 5 and 
##the target probability of DLE to be used at the end of a trial
##This is a ratio of the upper to the lower 95% credibility interval of the estimates
myStopping <- StoppingTDCIRatio(targetRatio=5,
                                targetEndOfTrial=0.3)



