library(RMark)


### Name: extract.indices
### Title: Various utility functions
### Aliases: extract.indices nat.surv pop.est compute.Sn
###   search.output.files logitCI

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Example of computing N-hat for occasions 2 to 7 for the p=~time model
data(dipper)
md=mark(dipper,model.parameters=list(p=list(formula=~time),
       Phi=list(formula=~1)))
# Create a matrix from the capture history strings 
xmat=matrix(as.numeric(unlist(strsplit(dipper$ch,""))),
      ncol=nchar(dipper$ch[1]))
# sum number of captures in each column but don't use the first 
# column because p[1] can't be estimated
ns=colSums(xmat)[-1]
# extract the indices and then get covariate predictions for p(2),...,p(7)
# which are row-colums 1-6 in PIM for p 
p.indices=extract.indices(md,"p",df=data.frame(group=rep(1,6),
   row=1:6,col=1:6))
p.list=covariate.predictions(md,data=data.frame(index=p.indices))
# call pop.est using diagonal design matrix to get 
# separate estimate for each occasion
pop.est(ns,p.list$estimates$estimate,
  design=diag(1,ncol=6,nrow=6),p.list$vcv)
## End(No test)



