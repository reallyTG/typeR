library(LCF)


### Name: std_df
### Title: Create a data frame of all standards
### Aliases: std_df
### Keywords: approximation, correction, standards

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
fit.standards <- std_df(sample = corr.spec.samples[[1]], 
  all.standards = corr.spec.standards)
print(fit.standards)



