library(HWEBayes)


### Name: HWEImportSamp
### Title: Importance sampling to calculate the normalizing constant under
###   the single f model
### Aliases: HWEImportSamp
### Keywords: htest

### ** Examples

alpha <- c(1,1,1,1) # prior on allele frequencies
# gmu and gsigma were obtained from a WinBUGS run
gmu <- c(-0.4633092,0.3391625,0.3397936,-3.5438008)
gsigma <- matrix(c(
0.07937341,0.02819656,0.02766583,0.04607996,
0.02819656,0.07091320,0.04023827,0.01657028,
0.02766583,0.04023827,0.07042278,0.01752266,
0.04607996,0.01657028,0.01752266,0.57273683),nrow=4,ncol=4)
data(DiabRecess)
HWEImportSamp(nsim=5000,nvec=DiabRecess,ischoice=1,lambdamu=-2.95,
   lambdasd=1.07,alpha=alpha,gmu,gsigma)
HWEImportSamp(nsim=5000,nvec=DiabRecess,ischoice=2,lambdamu=-2.95,
   lambdasd=1.07,alpha=alpha)



