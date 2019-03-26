library(RMark)


### Name: predict_real
### Title: Compute estimates of real parameters with individual and design
###   covariates
### Aliases: predict_real
### Keywords: utility

### ** Examples


data(dipper)
dp=process.data(dipper)
ddl=make.design.data(dp)
model=mark(dp,ddl,model.parameters=list(Phi=list(formula=~Time)))
predict_real(model,ddl$Phi[1,,drop=FALSE],"Phi",replicate=TRUE,data=data.frame(Time=-12:12))




