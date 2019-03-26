library(selectiongain)


### Name: multistagecor
### Title: Function for calculating correlation matrix in a plant breeding
###   context
### Aliases: multistagecor
### Keywords: Optimization

### ** Examples

# example for calculating correlation matrix without MAS 
multistagecor(VGCAandE=c(1,0.5,0.5,1,2),L=c(2,10),T=c(1,1),Rep=c(1,1))
multistagecor(VGCAandE="VC2",L=c(2,10),T=c(1,1),Rep=c(1,1),index=TRUE)

# example for calculating correlation matrix with MAS in the first stage 
VCgca=c(0.40,0.20,0.20,0.40,2.00)
VCsca=c(0.20,0.10,0.10,0.20)
corr.matrix = multistagecor (maseff=0.40, VGCAandE=VCgca,
VSCA=VCsca, T=c(1,1,5), L=c(1,3,8), Rep=c(1,1,1))




