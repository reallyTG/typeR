library(RcmdrPlugin.TeachStat)


### Name: DMKV.test
### Title: Z-test for the difference of means of two independent Normal
###   variables with known population variances.
### Aliases: DMKV.test

### ** Examples

data(cars93) # Data set provided with the package
# Maximum price difference (MaxPrice) in means between cars manufactured in the
# US and those manufactured outside, assuming that the variances are known and 
# equal to 64 and 169, respectively
var1<-subset(cars93, USA=="nonUS", select=MaxPrice)
var2<-subset(cars93, USA=="US", select=MaxPrice)
DMKV.test(var1, var2, sdx=13, sdy=8, difmu=0,
alternative="greater", conf.level=0.95)




