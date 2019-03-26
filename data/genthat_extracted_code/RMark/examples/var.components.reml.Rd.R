library(RMark)


### Name: var.components.reml
### Title: Variance components estimation using REML or maximum likelihood
### Aliases: var.components.reml

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Use dipper data with an age (0,1+)/time model for Phi
data(dipper)
dipper.proc=process.data(dipper,model="CJS")
dipper.ddl=make.design.data(dipper.proc,
   parameters=list(Phi=list(age.bins=c(0,.5,6))))
levels(dipper.ddl$Phi$age)=c("age0","age1+")
md=mark(dipper,model.parameters=list(Phi=list(formula=~time+age)))
# extract the estimates of Phi 
zz=get.real(md,"Phi",vcv=TRUE)
# assign age to use same intervals as these are not copied 
# across into the dataframe from get.real
zz$estimates$age=cut(zz$estimates$Age,c(0,.5,6),include=TRUE)
levels(zz$estimates$age)=c("age0","age1+")
z=zz$estimates
# Fit age fixed effects with random year component and an iid error
var.components.reml(z$estimate,design=model.matrix(~-1+age,z),
        zz$vcv,rdesign=model.matrix(~-1+time,z)) 
# Fitted model assuming no covariance structure to compare to 
# results with lme
xx=var.components.reml(z$estimate,design=model.matrix(~-1+age,z),
 matrix(0,nrow=nrow(zz$vcv),ncol=ncol(zz$vcv)),
 rdesign=model.matrix(~-1+time,z)) 
xx
sqrt(xx$sigmasq)
library(nlme)
nlme::lme(estimate~-1+age,data=z,random=~1|time)
## End(No test)



