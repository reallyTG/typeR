library(dsrTest)


### Name: dsrTest-package
### Title: Tests and Confidence Intervals on Directly Standardized Rates
###   for Several Methods
### Aliases: dsrTest-package
### Keywords: package

### ** Examples

## using the example from asht::wspoissonTest
## birth data on Down's syndrome from Michigan, 1950-1964
## see Table II  of Fay and Feuer (1997)
## xfive = counts for mothers who have had 5 or more children
## nfive and ntotal are number of live births 
xfive<-c(0, 8, 63, 112, 262, 295)
nfive<-c(327, 30666, 123419, 149919, 104088, 34392)
ntotal<-c(319933, 931318, 786511, 488235, 237863, 61313)
## use mult =10^5 to give rates per 100,000
## gamma method of Fay and Feuer (1997) is default
dsrTest(xfive, nfive, ntotal, method = "gamma", mult = 1e5)
## Dobson et al (1991)
dsrTest(xfive, nfive, ntotal, method = "dobson", mult = 1e5)
## Asymptotic with log transformation
dsrTest(xfive, nfive, ntotal, method = "asymptotic", mult = 1e5,
control = list(trans = "log"))



