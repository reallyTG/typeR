library(svapls)


### Name: svpls
### Title: Function for identfying the optimal ANCOVA model and detecting
###   the genes that are truly differentially expressed between the two
###   types of samples.
### Aliases: svpls
### Keywords: classes print methods

### ** Examples

## Loading the first dataset
data(hidden_fac.dat)

## Fitting the optimal ANCOVA model to the data gives:
fit <- svpls(10,10,hidden_fac.dat,pmax = 5)

## The optimal ANCOVA model, its AIC value and the positive genes detected from it are given by:
fit$opt.model 

fit$AIC.opt

fit$genes

## The corrected gene expression matrix obtained after removing the effects of
## the hidden variability is given by:

Y.corrected <- fit$Y.corr



