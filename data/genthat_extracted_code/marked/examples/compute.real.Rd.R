library(marked)


### Name: compute.real
### Title: Compute estimates of real parameters
### Aliases: compute.real
### Keywords: utility

### ** Examples

data(dipper)
dipper.proc=process.data(dipper,model="cjs",begin.time=1)
dipper.ddl=make.design.data(dipper.proc)
mod.Phisex.pdot=crm(dipper.proc,dipper.ddl,
 model.parameters=list(Phi=list(formula=~sex+time),p=list(formula=~1)),hessian=TRUE)
xx=compute.real(mod.Phisex.pdot,"Phi",unique=TRUE,vcv=TRUE)



