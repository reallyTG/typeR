library(tlm)


### Name: summary.tlm
### Title: Summarizing Linear, Logistic and Poisson Models Fits with
###   Transformed Variables.
### Aliases: summary.tlm print.summary.tlm

### ** Examples

### linear model with log-log transformation:
data(feld1)
modcat <-  tlm (y = logroom, x = logmattress, z = cat, data = feld1, ypow = 0, xpow = 0)
modcat
summary(modcat)



