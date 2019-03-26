library(plm)


### Name: pmg
### Title: Mean Groups (MG), Demeaned MG and CCE MG estimators
### Aliases: pmg summary.pmg print.summary.pmg
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
## Mean Groups estimator
mgmod <- pmg(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc)
summary(mgmod)

## demeaned Mean Groups
dmgmod <- pmg(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, 
             data = Produc, model = "dmg")
summary(dmgmod)

## Common Correlated Effects Mean Groups
ccemgmod <- pmg(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, 
                data = Produc, model = "cmg")
summary(ccemgmod)



