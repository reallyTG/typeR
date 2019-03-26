library(plm)


### Name: pcce
### Title: Common Correlated Effects estimators
### Aliases: pcce summary.pcce print.summary.pcce
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
ccepmod <- pcce(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc, model="p")
summary(ccepmod)



