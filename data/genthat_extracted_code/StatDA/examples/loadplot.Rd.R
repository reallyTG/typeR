library(StatDA)


### Name: loadplot
### Title: Plot the Loadings of a FA
### Aliases: loadplot
### Keywords: dplot multivariate

### ** Examples

data(moss)
var=c("Ag","Al","As","B","Ba","Bi","Ca","Cd","Co","Cr","Cu","Fe","Hg","K","Mg","Mn","Mo",
      "Na","Ni","P","Pb","Rb","S","Sb","Si","Sr","Th","Tl","U","V","Zn")
x=log10(moss[,var])

x.mcd=robustbase::covMcd(x,cor=TRUE)
x.rsc=scale(x,x.mcd$cent,sqrt(diag(x.mcd$cov)))
res5=pfa(x.rsc,factors=2,covmat=x.mcd,scores="regression",rotation="varimax",
    maxit=0,start=rep(0,ncol(x.rsc)))
loadplot(res5,titlepl="Robust FA (log-transformed)", crit=0.3)




