library(binGroup)


### Name: nDesign
### Title: Iterate Sample Size in One Parameter Group Testing
### Aliases: nDesign
### Keywords: htest

### ** Examples


## Assume one aims to show that a proportion is smaller
## 0.005 (i.e. 0.5 per cent) with a power 
## of 0.80 (i.e. 80 per cent) if the unknown proportion
## in the population is 0.003 (i.e. 0.3 per cent),
## thus, to detect a delta of 0.002.
## The Clopper Pearson CI shall be used. 
## The maximal group size because of limited
## sensitivity of assay might be s=20 and we
## can only afford to perform maximally 100 assays:

nDesign(nmax=100, s=20, delta=0.002, p.hyp=0.005,
 alternative="less", method="CP", power=0.8)

## A power of 80 per cent can not be reached but
## only 30 percent with n=100 
## One might accept to show significance only for a 
## lower true proportion = 0.001 i.e accepting to be
## able to show significance only if true proportion 
## is delta=0.004 smaller than the threshold

nDesign(nmax=100, s=20, delta=0.004, p.hyp=0.005,
 alternative="less", method="CP", power=0.8)


test<-nDesign(nmax=100, s=30, delta=0.004, p.hyp=0.005,
 alternative="less", method="CP", power=0.8)

plot(test)




