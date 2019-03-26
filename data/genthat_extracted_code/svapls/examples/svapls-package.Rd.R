library(svapls)


### Name: svapls-package
### Title: Surrogate variable analysis using Partial Least Squares in a
###   gene expression data
### Aliases: svapls-package svapls
### Keywords: models

### ** Examples

data(hidden_fac.dat)
fit <- svpls(10,10,hidden_fac.dat,pmax = 5)
fit$genes
Y.corrected <- fit$Y.corr

data(hidden_fac.dat)
gen <- paste("g",c(1:15,50:65),sep="")
sub <- paste("S",c(1:5,11:17),sep="")

hfp(fit,gen,sub,hidden_fac.dat)



