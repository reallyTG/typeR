library(itsmr)


### Name: autofit
### Title: Find the best model from a range of possible ARMA models
### Aliases: autofit

### ** Examples

M = c("diff",1)
e = Resid(dowj,M)
a = autofit(e)
print(a)



