library(SPCDAnalyze)


### Name: runSlopes
### Title: Runs a random slopes model for use with 'SPCDcontinuous'
### Aliases: runSlopes
### Keywords: htest

### ** Examples

data1=createTestData(times=0:11,n=c(50,50,50),transition=5,rx1=0,rx2=0)
data1=placeboNonResponder(data1,k=0)
#Example of use of function outside of SPCDcontinous
data1$trt=ifelse(data1$rx==3,'Active','Placebo')
runSlopes(data1,time='time')




