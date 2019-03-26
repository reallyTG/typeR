library(splm)


### Name: effects.splm
### Title: method for extracting fixed effects
### Aliases: effects.splm print.effects.splm
### Keywords: spatial

### ** Examples

data(Produc, package = "plm")
data(usaww)
fm <- log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp
err <- spml(fm, data = Produc, listw = mat2listw(usaww), model="within")
summary(err)
eff <- effects(err) 
print(eff)



