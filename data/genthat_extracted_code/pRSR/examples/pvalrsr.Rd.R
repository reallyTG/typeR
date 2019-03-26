library(pRSR)


### Name: pvalrsr
### Title: Finds pvalue for testing periodicity using RSR.
### Aliases: pvalrsr
### Keywords: ts

### ** Examples

# Non-Fourier frequency
z<-SimulateHReg(20, f=2.5/20, 1, 2)
pvalrsr(z)  # finding p-value using RSR

# For comparing with Fisher's g test
# library(GeneCycle)
# fisher.g.test(z) # Fisher's g test


# Fourier frequency
y<-SimulateHReg(20, f=2/20, 1, 2)
pvalrsr(y)  # finding p-value using RSR
# For comparing with Fisher's g test
# library(GeneCycle)
# fisher.g.test(z) # Fisher's g test



