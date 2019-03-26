library(RDStreeboot)


### Name: RDStreeboot-package
### Title: RDStreeboot: Tree Bootstrap Method
### Aliases: RDStreeboot-package RDStreeboot
### Keywords: package

### ** Examples

## load data
data(faux.network)

## draw RDS from network
samp <- sample.RDS(faux.network$traits, faux.network$adj.mat, 100, 2, 3, c(0,1/3,1/3,1/3), TRUE)

## estimate 80% and 95% confidence intervals
treeboot.RDS(samp, c(0.025, 0.10, 0.90, 0.975), 2000)



