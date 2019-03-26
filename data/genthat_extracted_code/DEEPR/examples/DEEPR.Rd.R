library(DEEPR)


### Name: DEEPR
### Title: Test two cophylogeny event count matrices
### Aliases: DEEPR
### Keywords: coevolution

### ** Examples

#Specify the cophylogeny event datasets to use
#In this example event counts are artificially generated
groupA<-simCophy(c(1,1,1,1), 20)
groupB<-simCophy(c(1,1,1,5), 20)

#Compare cophylogeny groups
#Here an extremely small permutation number is used here to shorten example run time
#A permutation number of 999 is recommended for real analysis.
DEEPR(groupA,groupB,9)




