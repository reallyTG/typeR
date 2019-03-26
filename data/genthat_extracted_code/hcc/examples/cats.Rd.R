library(hcc)


### Name: cats
### Title: Anatomical data from domestic cats
### Aliases: cats
### Keywords: datasets

### ** Examples

data(cats)
attach(cats)
mod<-lm(Hwt~Sex+Bwt+Sex:Bwt,data=cats)
res <- resid(mod)
hctest(Bwt, res)



