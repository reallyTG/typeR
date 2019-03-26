library(arulesSequences)


### Name: info-methods
### Title: Get/Set Object Information
### Aliases: sequenceInfo sequenceInfo,sequences-method sequenceInfo<-
###   sequenceInfo<-,sequences-method ruleInfo
###   ruleInfo,sequencerules-method ruleInfo<-
###   ruleInfo<-,sequencerules-method itemInfo itemInfo,sequences-method
###   itemInfo<- itemInfo<-,sequences-method timeInfo
###   timeInfo,timedsequences-method timeInfo<-
###   timeInfo<-,timedsequences-method
### Keywords: manip attribute

### ** Examples

## continue example
example(ruleInduction, package = "arulesSequences")

## empty
sequenceInfo(s2) <- sequenceInfo(s2)
ruleInfo(r2) <- ruleInfo(r2)

## item info
itemInfo(s2)


## time info
z <- as(zaki, "timedsequences")
timeInfo(z)



