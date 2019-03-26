library(splm)


### Name: print.splm
### Title: print method for class splm
### Aliases: print.splm
### Keywords: spatial

### ** Examples

data(Produc, package = "plm") 
data(usaww)
spremod<-spml(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc,
listw = mat2listw(usaww), model="random", lag=TRUE, spatial.error="none")
summary(spremod)



