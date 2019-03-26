library(splm)


### Name: spreml
### Title: Spatial Panel Model with Random Effects by Maximum Likelihood
### Aliases: spreml
### Keywords: spatial

### ** Examples

data(Produc, package = "plm")
data(usaww)
fm <- log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp
## random effects panel with spatial lag and serial error correlation
## optimization method set to "BFGS"
sarsrmod <- spreml(fm, data = Produc, w = usaww, errors="sr", lag=TRUE,
                    method="BFGS")
summary(sarsrmod)



