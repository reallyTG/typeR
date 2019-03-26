library(LCF)


### Name: plot_LCF
### Title: Plot sample data, linear combination fit and residual spectrum
### Aliases: plot_LCF
### Keywords: LCF plot,

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
param.float <- expand.grid(pre.adj.1 = seq(-45,-30,5), 
  pre.adj.2 = seq(-19,-9,5), post.adj.1 = seq(34,40,2), 
  post.adj.2 = seq(50,65,5))
float.fit <- fit_float(all.samples = corr.spec.samples[1], 
  all.standards = corr.spec.standards, LC.vals = c(-14, 46), 
  float = param.float, ex.smaller = 0.05)
par(pty="s")
plot_LCF(all.samples = corr.spec.samples[1], 
  all.standards = corr.spec.standards, 
  LCF.res = float.fit[1,], LC.vals = c(-14,46), 
  corr.norm = c(-36, -15, 37, 58))



