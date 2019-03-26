library(bda)


### Name: ld50.logit
### Title: Predict Doses for Binomial Assay model (using counts)
### Aliases: ld50.logit print.ld50 plot.ld50 lines.ld50
### Keywords: regression models

### ** Examples

ldose <- rep(0:5, 2)
numdead <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)
n=20

ld50.logit(numdead,n,ldose,p = 0.5)



