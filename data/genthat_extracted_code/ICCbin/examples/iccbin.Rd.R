library(ICCbin)


### Name: iccbin
### Title: Estimates Intracluster Correlation coefficients (ICC) and it's
###   confidence intervals (CI)
### Aliases: iccbin

### ** Examples

bccdata <- rcbin(prop = .4, prvar = .2, noc = 30, csize = 20, csvar = .2, rho = .2)
iccbin(cid = cid, y = y, data = bccdata)
iccbin(cid = cid, y = y, data = bccdata, method = c("aov", "fc"), ci.type = "fc")




