library(asht)


### Name: wspoissonTest
### Title: Test and Confidence Intervals on Weighted Sum of Poissons
### Aliases: wspoissonTest
### Keywords: htest

### ** Examples

## birth data on Down's syndrome from Michigan, 1950-1964
## see Table II  of Fay and Feuer (1997)
##xfive= counts for mothers who have had 5 or more children
## nfive and ntotal are number of live births 
xfive<-c(0,8,63,112,262,295)
nfive<-c(327,30666,123419,149919,104088,34392)
ntotal<-c(319933,931318,786511,488235,237863,61313)
## use mult =10^5 to give rates per 100,000
## gamma method of Fay and Feuer (1997) is default
wspoissonTest(xfive,ntotal/(nfive*sum(ntotal)),mult=10^5)
 



