library(StatDA)


### Name: pfa
### Title: Principal Factor Analysis
### Aliases: pfa
### Keywords: multivariate

### ** Examples

data(moss)
var=c("Ni","Cu","Mg","Rb","Mn")
x=log10(moss[,var])

x.mcd=robustbase::covMcd(x,cor=TRUE)
x.rsc=scale(x,x.mcd$cent,sqrt(diag(x.mcd$cov)))
pfa(x.rsc,factors=2,covmat=x.mcd,scores="regression",rotation="varimax",
    maxit=0,start=rep(0,ncol(x.rsc)))




