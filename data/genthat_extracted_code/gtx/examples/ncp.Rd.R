library(gtx)


### Name: chi2ncp
### Title: Compute non-centrality parameter of chi squared distribution.
### Aliases: chi2ncp

### ** Examples

## 0.80 power for 0.05 size test
chi2ncp(.05, .8)
## 0.80 power for genome-wide significance
chi2ncp(5e-08, .8)
## test
critval <- qchisq(5e-08, lower.tail = FALSE, df = 1)
pchisq(critval, ncp = chi2ncp(5e-08, .8), lower.tail = FALSE, df = 1)



