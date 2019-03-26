library(splm)


### Name: bsjktest
### Title: Baltagi, Song, Jung and Koh LM test for spatial panels
### Aliases: bsjktest bsjktest.formula
### Keywords: htest

### ** Examples

data(Produc, package="plm")
data(usaww)
fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp
bsjktest(fm, data=Produc, listw = usaww, test="C.1")



