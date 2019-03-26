library(splm)


### Name: bsktest
### Title: Baltagi, Song and Koh LM test for spatial panels
### Aliases: bsktest bsktest.formula
### Keywords: htest

### ** Examples

data(Produc, package="plm")
data(usaww)
fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp
bsktest(fm,data=Produc, listw = mat2listw(usaww),
  test="LM1")



