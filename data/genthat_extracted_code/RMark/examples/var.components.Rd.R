library(RMark)


### Name: var.components
### Title: Variance components estimation
### Aliases: var.components

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
md=mark(dipper,model.parameters=list(Phi=list(formula=~time)))
md$results$AICc
zz=get.real(md,"Phi",vcv=TRUE)
z=zz$estimates$estimate[1:6]
vcv=zz$vcv.real
varc=var.components(z,design=matrix(rep(1,length(z)),ncol=1),vcv) 
df=md$design.data$Phi
shrinkest=data.frame(time=1:6,value=varc$betarand$estimate)
df=merge(df,shrinkest,by="time")
md=mark(dipper,model.parameters=list(Phi=list(formula=~time,
  fixed=list(index=df$par.index,value=df$value))),adjust=FALSE)
npar=md$results$npar+varc$GTrace
md$results$lnl+2*(npar + (npar*(npar+1))/(md$results$n-npar-1))
## End(No test)



