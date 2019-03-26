library(TestingSimilarity)


### Name: bootstrap_test
### Title: Bootstrap test for testing dose response curves for similarity
###   concerning the maximum absolute deviation
### Aliases: bootstrap_test

### ** Examples

library("DoseFinding")
library("alabama")
data(IBScovars)
male<-IBScovars[1:118,]
female<-IBScovars[119:369,]
bootstrap_test(male,female,"linear","emax",epsilon=0.35,B=300)



