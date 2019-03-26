library(psych)


### Name: corr.test
### Title: Find the correlations, sample sizes, and probability values
###   between elements of a matrix or data.frame.
### Aliases: corr.test corr.p
### Keywords: multivariate models

### ** Examples


ct <- corr.test(attitude)  #find the correlations and give the probabilities
ct #show the results
cts <- corr.test(attitude[1:3],attitude[4:6]) #reports all values corrected for multiple tests

#corr.test(sat.act[1:3],sat.act[4:6],adjust="none")  #don't adjust the probabilities

#take correlations and show the probabilities as well as the confidence intervals
print(corr.p(cts$r,n=30),short=FALSE)  

#don't adjust the probabilities
print(corr.test(sat.act[1:3],sat.act[4:6],adjust="none"),short=FALSE)  




