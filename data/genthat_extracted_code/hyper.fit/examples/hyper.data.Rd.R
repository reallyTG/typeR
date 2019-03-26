library(hyper.fit)


### Name: hyper.data
### Title: Data included in hyper.fit package
### Aliases: hyper.data hogg intrin trumpet FP6dFGS GAMAsmVsize
###   convtest2dOpt convtest2dLD convtest1dNorm TFR MJB
### Keywords: fit data

### ** Examples

hogg=read.table(system.file('data/hogg.tab', package='hyper.fit'),header=TRUE)
#or
data(hogg)
print(hogg[1:10,])

intrin=read.table(system.file('data/intrin.tab', package='hyper.fit'), header=TRUE)
#or
data(intrin)
print(intrin[1:10,])

trumpet=read.table(system.file('data/trumpet.tab', package='hyper.fit'), header=TRUE)
#or
data(trumpet)
print(trumpet[1:10,])

FP6dFGS=read.table(system.file('data/FP6dFGS.tab', package='hyper.fit'), header=TRUE)
#or
data(FP6dFGS)
print(FP6dFGS[1:10,])

GAMAsmVsize=read.table(system.file('data/GAMAsmVsize.tab', package='hyper.fit'), header=TRUE)
#or
data(GAMAsmVsize)
print(GAMAsmVsize[1:10,])

TFR=read.table(system.file('data/TFR.tab', package='hyper.fit'), header=TRUE)
#or
data(TFR)
print(TFR[1:10,])

MBJ=read.table(system.file('data/MJB.tab', package='hyper.fit'), header=TRUE)
#or
data(MJB)
print(MJB[1:10,])




