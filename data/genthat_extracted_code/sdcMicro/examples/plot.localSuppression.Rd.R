library(sdcMicro)


### Name: plot.localSuppression
### Title: plot method for localSuppression objects
### Aliases: plot.localSuppression
### Keywords: aplot

### ** Examples

## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
l1 <- localSuppression(francdat, keyVars=c(2,4,5,6))
l1
plot(l1)

## with details of suppression by strata
data(testdata2)
testdata2$ageG <- cut(testdata2$age, 5, labels=paste0("AG",1:5))
keyVars <- c("urbrur","roof","walls","water","electcon","relat","sex")
strataVars <- c("ageG")
inp <- testdata2[,c(keyVars, strataVars)]
ls <- localSuppression(inp, keyVars=1:7, strataVars=8)
print(ls)
plot(ls)
plot(ls, showDetails=TRUE)




