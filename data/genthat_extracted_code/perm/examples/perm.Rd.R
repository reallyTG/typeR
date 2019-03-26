library(perm)


### Name: perm
### Title: Exact or Asymptotic 2-sample, k-sample, and trend permutation
###   tests
### Aliases: permTS permTS.default permTS.formula permKS permKS.default
###   permKS.formula permTREND permTREND.default permTREND.formula
### Keywords: htest nonparametric

### ** Examples

## Example from StatExact manual
dBP<-c(94,108,110,90,80,94,85,90,90,90,108,94,78,105,88)
treatment<-c(rep("treated",4),rep("control",11))
permTS(dBP~treatment,alternative="less",method="pclt")
result<-permTS(dBP[treatment=="treated"],dBP[treatment=="control"],alternative="greater")
result
result$p.values



