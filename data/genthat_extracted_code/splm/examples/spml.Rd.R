library(splm)


### Name: spml
### Title: Spatial Panel Model by Maximum Likelihood
### Aliases: spml
### Keywords: spatial

### ** Examples

data(Produc, package = "plm")
data(usaww)
fm <- log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp
## the two standard specifications (SEM and SAR) one with FE
## and the other with RE:
## fixed effects panel with spatial errors
fespaterr <- spml(fm, data = Produc, listw = mat2listw(usaww),
                   model="within", spatial.error="b", Hess = FALSE)
summary(fespaterr)
## random effects panel with spatial lag
respatlag <- spml(fm, data = Produc, listw = mat2listw(usaww),
                   model="random", spatial.error="none", lag=TRUE)
summary(respatlag)
## calculate impact measures
impac1 <- impacts(respatlag, listw = mat2listw(usaww, style = "W"), time = 17)
summary(impac1, zstats=TRUE, short=TRUE)



