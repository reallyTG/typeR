library(lmf)


### Name: ci.boot.lmf
### Title: Confidence intervals for class "boot.lmf"
### Aliases: ci.boot.lmf print.ci.boot.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Bootstrap parameters
b.1 <- boot.lmf(object = lmf.1, nboot = 10, sig.dj = TRUE,
 what = "all", asim = "parametric")
#Generate CI
ci.boot.lmf(b.1)



