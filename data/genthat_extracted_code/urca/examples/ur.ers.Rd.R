library(urca)


### Name: ur.ers
### Title: Elliott, Rothenberg & Stock Unit Root Test
### Aliases: ur.ers
### Keywords: regression

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
ers.gnp <- ur.ers(gnp, type="DF-GLS", model="const", lag.max=4)
summary(ers.gnp)



