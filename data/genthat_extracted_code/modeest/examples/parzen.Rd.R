library(modeest)


### Name: parzen
### Title: Parzen's Kernel mode estimator
### Aliases: parzen Parzen

### ** Examples

# Unimodal distribution 
x <- rlnorm(10000, meanlog = 3.4, sdlog = 0.2) 

## True mode 
lnormMode(meanlog = 3.4, sdlog = 0.2) 

## Estimate of the mode 
mlv(x, method = "kernel", kernel = "gaussian", bw = 0.3, par = shorth(x)) 




