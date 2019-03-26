library(plm)


### Name: pggls
### Title: General FGLS Estimators
### Aliases: pggls summary.pggls print.summary.pggls
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
zz_wi <- pggls(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
               data = Produc, model = "within")
summary(zz_wi)

zz_pool <- pggls(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, 
                 data = Produc, model = "pooling")
summary(zz_pool)

zz_fd <- pggls(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
               data = Produc, model = "fd")
summary(zz_fd)




