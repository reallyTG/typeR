library(plm)


### Name: ercomp
### Title: Estimation of the error components
### Aliases: ercomp ercomp.formula ercomp.plm print.ercomp
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
# an example of the formula method
ercomp(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc,
       method = "walhus", effect = "time")
# same with the plm method
z <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
         data = Produc, random.method = "walhus",
         effect = "time", model = "random")
ercomp(z)
# a two-ways model
ercomp(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, data = Produc,
       method = "amemiya", effect = "twoways")



