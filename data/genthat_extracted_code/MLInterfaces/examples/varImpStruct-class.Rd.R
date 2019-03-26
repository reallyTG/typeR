library(MLInterfaces)


### Name: varImpStruct-class
### Title: Class "varImpStruct" - collect data on variable importance from
###   various machine learning methods
### Aliases: varImpStruct-class plot plot,varImpStruct-method
###   plot,varImpStruct,ANY-method show,varImpStruct-method
###   report,varImpStruct-method report getVarImp
###   getVarImp,classifOutput,logical-method
###   getVarImp,classifierOutput,logical-method
###   getVarImp,classifierOutput,missing-method
### Keywords: classes

### ** Examples

library(golubEsets)
data(Golub_Merge)
library(hu6800.db)
smallG <- Golub_Merge[1001:1060,]
set.seed(1234)
opar=par(no.readonly=TRUE)
par(las=2, mar=c(10,11,5,5))
rf2 <- MLearn(ALL.AML~., smallG, randomForestI, 1:40, importance=TRUE,
 sampsize=table(smallG$ALL.AML[1:40]), mtry=sqrt(ncol(exprs(smallG))))
plot( getVarImp( rf2, FALSE ), n=10, plat="hu6800", toktype="SYMBOL")
par(opar)
report( getVarImp( rf2, FALSE ), n=10, plat="hu6800", toktype="SYMBOL")



