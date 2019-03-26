library(lmf)


### Name: boot.lmf
### Title: Bootstrap resampling for class "lmf"
### Aliases: boot.lmf print.boot.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Bootstrap parameters
b.1 <- boot.lmf(object = lmf.1, nboot = 10, sig.dj = TRUE,
 what = "all", asim = "parametric")
#Print
b.1
#Summary
summary(b.1)
#View density plots
plot(b.1)
#Test of hypoteses
b.2 <- boot.lmf(object = lmf.1, nboot = 10, sig.dj = TRUE,
 what = "H0", H0exp = list(rep(0, 3), matrix(0, ncol = 3, nrow = 3)),
 asim = "parametric")
#Summary
summary(b.2)



