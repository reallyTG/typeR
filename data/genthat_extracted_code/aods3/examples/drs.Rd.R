library(aods3)


### Name: drs
### Title: Test of Proportion Homogeneity between Groups using Donner's and
###   Rao-Scott's Adjustments
### Aliases: drs print.drs
### Keywords: datagen

### ** Examples

data(dja)
# Donner
drs(formula = cbind(m, n - m) ~ group, data = dja, type = "d")
# Rao and Scott
drs(formula = cbind(m, n - m) ~ group, type = "rs", data = dja)
drs(formula = cbind(m, n - m) ~ group, type = "rs", data = dja, pooled = TRUE)
# standard chi2 test
drs(formula = cbind(m, n - m) ~ group, data = dja, type = "d", C = c(1:1))
drs(formula = cbind(m, n - m) ~ group, data = dja, type = "rs", C = c(1:1))



