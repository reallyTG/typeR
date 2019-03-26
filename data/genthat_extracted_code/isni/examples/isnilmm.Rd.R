library(isni)


### Name: isnilmm
### Title: Function for ISNI computation when the outcome follows LMM.
### Aliases: isnilmm

### ** Examples


data(qolef)
ymodel= y | g+ gp~   as.factor(time)*group+perf+sever

##Random intercept model
result=isnilmm(ymodel, random=~1, id=id,  data=qolef)
summary(result)




