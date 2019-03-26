library(stpm)


### Name: spm_cont_lin
### Title: Continuous multi-dimensional optimization with linear terms in
###   mu only
### Aliases: spm_cont_lin

### ** Examples

library(stpm)
#Reading the data:
data <- simdata_cont(N=2)
head(data)
#Parameters estimation:
pars <- spm_cont_lin(dat=data,a=-0.05, f1=80, 
					           Q=2e-8, f=80, b=5, mu0=2e-5)
pars




