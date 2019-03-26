library(FSTpackage)


### Name: FST.SummaryStat.test
### Title: Using summary statistics to test the association between an
###   quantitative/dichotomous outcome variable and a gene by a score type
###   test allowing for multiple functional annotation scores.
### Aliases: FST.SummaryStat.test
### Keywords: test

### ** Examples

## FST.SummaryStat.test tests a region.
# Input: score (a score vector), Sigma (the covariance matrix of the score vector)

library(FSTpackage)

data(FST.example)
score<-FST.example$score;Sigma<-FST.example$Sigma;Z<-FST.example$Z;weights<-FST.example$weights

# test with 5000 bootstrap replicates
result<-FST.SummaryStat.test(score,Sigma,Z,weights,B=5000)



