library(splm)


### Name: sphtest
### Title: Hausman test for spatial panel data models
### Aliases: sphtest sphtest.formula sphtest.splm
### Keywords: htest

### ** Examples

data(Produc, package="plm")
data(usaww)
fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp
test1<-sphtest(fm,data=Produc, listw = mat2listw(usaww),
                spatial.model = "error", method="GM")
test1
mod1<- spgm(fm, data=Produc, listw = usaww, model = "random",
             spatial.error = TRUE, moments="fullweights")
mod2<- spgm(fm, data=Produc, listw = usaww, model = "within",
             spatial.error = TRUE)
test2<-sphtest(mod1, mod2)
test2



