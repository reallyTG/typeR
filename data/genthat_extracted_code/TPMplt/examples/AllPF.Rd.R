library(TPMplt)


### Name: AllPF
### Title: Fit all flow stress values in high strain conditions
### Aliases: AllPF
### Keywords: AllPF

### ** Examples

# Use multi-function fitting for curves
x <- AllPF(TPMdata, subsec = c(0.015, 0.2))
SSplots(x, 2, mfrow=c(2, 2))



