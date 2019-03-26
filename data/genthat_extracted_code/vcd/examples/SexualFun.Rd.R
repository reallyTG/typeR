library(vcd)


### Name: SexualFun
### Title: Sex is Fun
### Aliases: SexualFun
### Keywords: datasets

### ** Examples

data("SexualFun")

## Kappa statistics
Kappa(SexualFun)

## Agreement Chart
agreementplot(t(SexualFun), weights = 1)
## Partial Agreement Chart and B-Statistics
agreementplot(t(SexualFun),
              xlab = "Husband's Rating",
              ylab = "Wife's Rating",
              main = "Husband's and Wife's Sexual Fun")



