library(plm)


### Name: pwtest
### Title: Wooldridge's Test for Unobserved Effects in Panel Models
### Aliases: pwtest pwtest.panelmodel pwtest.formula
### Keywords: htest

### ** Examples

data("Produc", package = "plm")
## formula interface
pwtest(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc)
pwtest(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc, effect = "time")

## panelmodel interface
# first, estimate a pooling model, than compute test statistics
form <- formula(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp)
pool_prodc <- plm(form, data = Produc, model = "pooling")
pwtest(pool_prodc) # == effect="individual"
pwtest(pool_prodc, effect="time")



