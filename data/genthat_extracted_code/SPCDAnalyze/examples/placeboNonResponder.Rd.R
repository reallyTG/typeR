library(SPCDAnalyze)


### Name: placeboNonResponder
### Title: Example of helper function for determining placebo nonresponse
### Aliases: placeboNonResponder
### Keywords: htest

### ** Examples

data1=createTestData(times=0:11,n=c(50,50,50),transition=5,rx1=0,rx2=0)
data1=placeboNonResponder(data1,k=0)



