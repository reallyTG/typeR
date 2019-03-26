library(splm)


### Name: slmtest
### Title: Locally robust panel Lagrange Multiplier tests for spatial
###   dependence
### Aliases: slmtest slmtest.formula slmtest.plm
### Keywords: htest

### ** Examples

data(Produc, package="plm")
data(usaww)
fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp
## robust LM test for spatial error sub spatial lag
## model on original data, pooling hypothesis
slmtest(fm, data=Produc, listw = usaww, test="rlme")
## model on within-transformed (time-demeaned) data,
## eliminates individual effects
slmtest(fm, data=Produc, listw = usaww, test="rlme",
  model="within")



