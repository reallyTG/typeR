library(ape)


### Name: chronos
### Title: Molecular Dating by Penalised Likelihood and Maximum Likelihood
### Aliases: chronos makeChronosCalib chronos.control print.chronos
### Keywords: models

### ** Examples

tr <- rtree(10)
### the default is the correlated rate model:
chr <- chronos(tr)
### strict clock model:
ctrl <- chronos.control(nb.rate.cat = 1)
chr.clock <- chronos(tr, model = "discrete", control = ctrl)
### How different are the rates?
attr(chr, "rates")
attr(chr.clock, "rates")
## Not run: 
##D cal <- makeChronosCalib(tr, interactive = TRUE)
##D cal
##D ### if you made mistakes, you can edit the data frame with:
##D ### fix(cal)
##D chr <- chronos(tr, calibration = cal)
## End(Not run)



