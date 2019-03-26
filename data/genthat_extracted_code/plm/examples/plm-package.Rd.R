library(plm)


### Name: plm-package
### Title: plm package: linear models for panel data
### Aliases: plm-package
### Keywords: package model regression

### ** Examples

data("Produc", package = "plm")
zz <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
          data = Produc, index = c("state","year"))
summary(zz)

# replicates some results from Baltagi (2013), table 3.1
data("Grunfeld", package = "plm")
p <- plm(inv ~ value + capital,
         data = Grunfeld, model="pooling")

wi <- plm(inv ~ value + capital,
          data = Grunfeld, model="within", effect = "twoways")

swar <- plm(inv ~ value + capital,
            data = Grunfeld, model="random", effect = "twoways")
          
amemiya <- plm(inv ~ value + capital,
               data = Grunfeld, model = "random", random.method = "amemiya",
               effect = "twoways")
                
walhus <- plm(inv ~ value + capital,
              data = Grunfeld, model = "random", random.method = "walhus",
              effect = "twoways")



