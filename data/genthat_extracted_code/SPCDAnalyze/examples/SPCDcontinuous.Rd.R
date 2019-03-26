library(SPCDAnalyze)


### Name: SPCDcontinuous
### Title: Analyze continuous data for the Sequential Parallel Comparison
###   Design(SPCD) study
### Aliases: SPCDcontinuous
### Keywords: htest

### ** Examples

data1=createTestData(times=0:11,n=c(50,50,50),transition=5,rx1=0,rx2=0)
data1=placeboNonResponder(data1,k=0)
SPCDcontinuous(data1,'ID','time','rx','transition',
  nonResponder='nonResponder',outcome='y',w=.5,runmod=runSlopes)
data1=createTestData(times=c(0,5,11),n=c(50,50,50),
  transition=5,rx1=0,rx2=0)
data1=placeboNonResponder(data1,k=0)
SPCDcontinuous(data1,'ID','time','rx','transition',
  nonResponder='nonResponder',outcome='y',w=.5,runmod=runGls)



