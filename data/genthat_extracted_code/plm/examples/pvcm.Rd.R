library(plm)


### Name: pvcm
### Title: Variable Coefficients Models for Panel Data
### Aliases: pvcm summary.pvcm print.summary.pvcm
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
zw <- pvcm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc, model = "within")
zr <- pvcm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc, model = "random")

## replicate Greene (2012), p. 419, table 11.14
summary(pvcm(log(gsp) ~ log(pc) + log(hwy) + log(water) + log(util) + log(emp) + unemp, 
             data = Produc, model = "random"))



