library(marked)


### Name: predict.crm
### Title: Compute estimates of real parameters
### Aliases: predict.crm
### Keywords: utility

### ** Examples

data(dipper)
dipper.proc=process.data(dipper,model="cjs",begin.time=1)
dipper.ddl=make.design.data(dipper.proc)
mod.Phisex.pdot=crm(dipper.proc,dipper.ddl,
   model.parameters=list(Phi=list(formula=~sex+time),p=list(formula=~1)),hessian=TRUE)
xx=predict(mod.Phisex.pdot,ddl=dipper.ddl)
xx
xx=predict(mod.Phisex.pdot,newdata=dipper[c(1,23),],vcv=TRUE)
xx



