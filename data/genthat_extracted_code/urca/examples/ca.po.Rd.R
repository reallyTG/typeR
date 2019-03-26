library(urca)


### Name: ca.po
### Title: Phillips & Ouliaris Cointegration Test
### Aliases: ca.po
### Keywords: regression

### ** Examples

data(ecb)
m3.real <- ecb[,"m3"]/ecb[,"gdp.defl"]
gdp.real <- ecb[,"gdp.nom"]/ecb[,"gdp.defl"]
rl <- ecb[,"rl"]
ecb.data <- cbind(m3.real, gdp.real, rl)
m3d.po <- ca.po(ecb.data, type="Pz")
summary(m3d.po)



