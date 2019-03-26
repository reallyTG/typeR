library(MGLM)


### Name: DMD.DM.fit
### Title: Fit multivariate discrete distributions
### Aliases: DMD.DM.fit DMD.GDM.fit DMD.NegMN.fit MGLMfit
### Keywords: Distribution Models fitting

### ** Examples

data(rnaseq)
Y <- as.matrix(rnaseq[, 1:6])
fit <- MGLMfit(data=Y, dist="GDM") 





