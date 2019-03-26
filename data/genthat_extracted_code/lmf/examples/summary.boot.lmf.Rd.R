library(lmf)


### Name: summary.boot.lmf
### Title: Summarizing bootstraps of lmf fits
### Aliases: summary.boot.lmf print.summary.boot.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Bootstrap parameters
b.1 <- boot.lmf(object = lmf.1, nboot = 10, sig.dj = TRUE,
 what = "all", asim = "parametric")
#Summary
summary(b.1)



