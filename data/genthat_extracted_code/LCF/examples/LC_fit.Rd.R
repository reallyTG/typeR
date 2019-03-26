library(LCF)


### Name: LC_fit
### Title: Linear combination fitting function
### Aliases: LC_fit
### Keywords: correction normalization,

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
fit.standards <- std_df(sample = corr.spec.samples[[1]], 
  all.standards = corr.spec.standards)
fit.result <- LC_fit(sample = corr.spec.samples[[1]], 
  standards = fit.standards, LC.vals = c(-14, 46))
print(fit.result)



