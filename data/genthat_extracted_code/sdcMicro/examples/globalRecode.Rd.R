library(sdcMicro)


### Name: globalRecode
### Title: Global Recoding
### Aliases: globalRecode
### Keywords: manip

### ** Examples

data(free1)
free1 <- as.data.frame(free1)

## application to a vector
head(globalRecode(free1$AGE, breaks=c(1,9,19,29,39,49,59,69,100), labels=1:8))
table(globalRecode(free1$AGE, breaks=c(1,9,19,29,39,49,59,69,100), labels=1:8))

## application to a data.frame
# automatic labels
table(globalRecode(free1, column="AGE", breaks=c(1,9,19,29,39,49,59,69,100))$AGE)

## calculation of brea-points using different algorithms
table(globalRecode(free1$AGE, breaks=6))
table(globalRecode(free1$AGE, breaks=6, method="logEqui"))
table(globalRecode(free1$AGE, breaks=6, method="equalAmount"))

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- globalRecode(sdc, column="water", breaks=3)
table(get.sdcMicroObj(sdc, type="manipKeyVars")$water)



