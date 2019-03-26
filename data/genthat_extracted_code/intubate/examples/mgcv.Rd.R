library(intubate)


### Name: mgcv
### Title: Interfaces for mgcv package for data science pipelines.
### Aliases: ntbt_bam ntbt_gamm
### Keywords: intubate magrittr mgcv bam gam gamm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(mgcv)
##D 
##D ## ntbt_bam: Generalized additive models for very large datasets
##D set.seed(3)
##D dat <- gamSim(1,n=25000,dist="normal",scale=20)
##D bs <- "cr"
##D k <- 12
##D 
##D ## Original function to interface
##D bam(y ~ s(x0, bs=bs) + s(x1, bs=bs) + s(x2, bs=bs, k=k) + s(x3, bs=bs), data = dat)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bam(dat, y ~ s(x0, bs=bs) + s(x1, bs=bs) + s(x2, bs=bs, k=k) + s(x3, bs=bs))
##D 
##D ## so it can be used easily in a pipeline.
##D dat %>%
##D   ntbt_bam(y ~ s(x0, bs=bs) + s(x1, bs=bs) + s(x2, bs=bs, k=k) + s(x3, bs=bs))
##D 
##D 
##D ## ntbt_gam: Generalized additive models with integrated smoothness estimation
##D set.seed(2) ## simulate some data... 
##D dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
##D ## Original function to interface
##D gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gam(dat, y ~ s(x0) + s(x1) + s(x2) + s(x3))
##D 
##D ## so it can be used easily in a pipeline.
##D dat %>%
##D   ntbt_gam(y ~ s(x0) + s(x1) + s(x2) + s(x3))
##D 
##D 
##D ## ntbt_gamm: Generalized Additive Mixed Models
##D set.seed(0)
##D dat <- gamSim(1, n = 200, scale = 2)
##D 
##D ## Original function to interface
##D gamm(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gamm(dat, y ~ s(x0) + s(x1) + s(x2) + s(x3))
##D 
##D ## so it can be used easily in a pipeline.
##D dat %>%
##D   ntbt_gamm(y ~ s(x0) + s(x1) + s(x2) + s(x3))
## End(Not run)



