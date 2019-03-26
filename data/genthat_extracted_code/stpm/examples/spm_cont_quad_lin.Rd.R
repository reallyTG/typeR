library(stpm)


### Name: spm_cont_quad_lin
### Title: Continuous multi-dimensional optimization with quadratic and
###   linear terms
### Aliases: spm_cont_quad_lin

### ** Examples

library(stpm)
#Reading the data:
data <- simdata_cont(N=2)
head(data)
#Parameters estimation:
pars <- spm_cont_quad_lin(dat=data,a=-0.05, f1=80, 
					           Q=2e-8, f=80, b=5, mu0=2e-5, Q1=1e-08)
pars




