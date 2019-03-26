library(HistDAWass)


### Name: WH.var.covar
### Title: Method WH.var.covar
### Aliases: WH.var.covar WH.var.covar,MatH-method

### ** Examples

WH.var.covar(BLOOD)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD))
WH.var.covar(BLOOD,w=RN)



