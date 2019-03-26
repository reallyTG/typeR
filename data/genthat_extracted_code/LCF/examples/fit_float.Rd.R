library(LCF)


### Name: fit_float
### Title: Central fitting function with float environment
### Aliases: fit_float
### Keywords: float parameters

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
## Select parameters for baseline correction and edge-step normalization
param.float <- expand.grid(pre.adj.1 = seq(-42,-30,6), 
  pre.adj.2 = seq(-19,-9,5), post.adj.1 = seq(35,40,5), 
  post.adj.2 = seq(50,65,5))
length(param.float[,1])
float.fit <- fit_float(all.samples = corr.spec.samples,
  all.standards = corr.spec.standards, 
  LC.vals = c(-14, 46), float = param.float, best.fits = 20)
print(float.fit)

###### Using next configuration can be very time consuming 

param.float.2 <- expand.grid(pre.adj.1 = seq(-43,-30,1), 
  pre.adj.2 = seq(-19,-9,.5), post.adj.1 = seq(34,40,.5), 
  post.adj.2 = seq(50,65,1))



