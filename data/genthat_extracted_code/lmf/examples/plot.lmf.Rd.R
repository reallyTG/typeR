library(lmf)


### Name: plot.lmf
### Title: Plot diagnostics for an lmf object
### Aliases: plot.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Diagnostic plots across all age classes and years
par(mfrow = c(2, 2))
plot(lmf.1)
#Diagnostic plots for each age class within each year (the
#actual linear regressions)
par(mfrow = c(2, 2))
plot(lmf.1, what = "age-year")



