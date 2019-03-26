library(splm)


### Name: rwtest
### Title: Randomization-based test of spatial dependence for panel models
### Aliases: rwtest rwtest.formula rwtest.panelmodel rwtest.pseries
### Keywords: htest

### ** Examples

data(Produc, package = "plm")
data(usaww)
fm <- log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp
## test on heterogeneous model (separate time series regressions)
rwtest(fm, data = Produc, w=usaww, index = c("state", "year"))

## test on two-way fixed effects homogeneous model
rwtest(fm, data = Produc, w=usaww, index = c("state", "year"),
       model = "within", effect = "twoways")

## test on panelmodel object
library(plm)
g <- plm(fm, data = Produc)
rwtest(g, w=usaww)

## test on pseries, higher-order neighbourhood
pprod <- pdata.frame(Produc)
rwtest(pprod$gsp, w=usaww, order=3)



