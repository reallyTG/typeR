library(metaRNASeq)


### Name: IDD.IRR
### Title: Integration-driven Discovery and Integration-driven Revision
###   Rates
### Aliases: IDD.IRR
### Keywords: methods models

### ** Examples

data(rawpval)
adjpval<-lapply(rawpval, FUN=function(x) p.adjust(x, method="BH"))
ind_smalladjp<-lapply(adjpval, FUN=function(x) which(x <= 0.05))
#indicators corresponding to the inverse normal p-value combination
invnormcomb <- invnorm(rawpval,nrep=c(8,8), BHth = 0.05) 
IDD.IRR(invnormcomb$DEindices,ind_smalladjp)
#indicators corresponding to the p-value combination with Fisher's method
fishcomb <- fishercomb(rawpval, BHth = 0.05)
IDD.IRR(fishcomb$DEindices,ind_smalladjp)



