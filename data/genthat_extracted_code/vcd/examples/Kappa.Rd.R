library(vcd)


### Name: Kappa
### Title: Cohen's Kappa and Weighted Kappa
### Aliases: Kappa print.Kappa confint.Kappa summary.Kappa
###   print.summary.Kappa
### Keywords: category

### ** Examples

data("SexualFun")
K <- Kappa(SexualFun)
K
confint(K)
summary(K)
print(K, CI = TRUE)




