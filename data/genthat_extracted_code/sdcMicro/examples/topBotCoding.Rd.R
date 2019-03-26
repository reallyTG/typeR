library(sdcMicro)


### Name: topBotCoding
### Title: Top and Bottom Coding
### Aliases: topBotCoding
### Keywords: manip

### ** Examples

data(free1)
res <- topBotCoding(free1[,"DEBTS"], value=9000, replacement=9100, kind="top")
max(res)

data(testdata)
range(testdata$age)
testdata <- topBotCoding(testdata, value=80, replacement=81, kind="top", column="age")
range(testdata$age)

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2, keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
           numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- topBotCoding(sdc, value=500000, replacement=1000, column="income")
testdataout <- extractManipData(sdc)



