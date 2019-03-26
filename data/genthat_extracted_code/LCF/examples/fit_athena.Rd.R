library(LCF)


### Name: fit_athena
### Title: Porting of 'ATHENA' linear combination fitting
### Aliases: fit_athena
### Keywords: correction normalization

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
athena.fit <- fit_athena(all.samples = corr.spec.samples, 
  all.standards = corr.spec.standards, LC.vals = c(-14, 46), amoSTD = 4)
## exclude portions smaller 5% = 0.05
athena.fit.exlcude <- fit_athena(all.samples = corr.spec.samples, 
  all.standards = corr.spec.standards, 
  LC.vals = c(-14, 46), amoSTD = 4, ex.smaller = 0.05)



