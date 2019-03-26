library(asht)


### Name: wmwTest
### Title: Wilcoxon-Mann-Whitney test with Confidence Interval on
###   Mann-Whitney Parameter
### Aliases: wmwTest wmwTest.default wmwTest.formula wmwTest.matrix
### Keywords: htest

### ** Examples

# data from Table 1 of Hanley and McNeil (also given in Table 1 of Newcombe, 2006)
HMdata<-matrix(c(33,3,6,2,6,2,11,11,2,33),nrow=2,dimnames=
   list(c("Normal","Abnormal"),
   c("Definitely Normal",
   "Probably Normal",
   "Questionable",
   "Probably Abnormal",
   "Definitely Abnormal")))
HMdata
# to match Newcombe (2006, Table 1, Method 5) exactly 
# use correct=FALSE and RemoveTeAdjustment=TRUE
wmwTest(HMdata, correct=FALSE, RemoveTieAdjustment=TRUE)
# generally smaller intervals with closer to nominal coverage with 
# tie adjustment and continuity correction
wmwTest(HMdata)



