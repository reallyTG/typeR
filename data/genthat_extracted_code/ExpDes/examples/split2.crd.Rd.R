library(ExpDes)


### Name: split2.crd
### Title: Split-plots in CRD
### Aliases: split2.crd

### ** Examples

data(ex9)
attach(ex9)
split2.crd(cobertura, prof, rep, pH, quali = c(TRUE, TRUE), mcomp = "lsd", 
 fac.names = c("Cover", "Depth"), sigT = 0.05, sigF = 0.05)



