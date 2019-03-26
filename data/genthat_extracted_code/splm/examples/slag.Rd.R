library(splm)


### Name: slag
### Title: Spatial lag operator
### Aliases: slag slag.default slag.pseries
### Keywords: slag

### ** Examples

data(Produc, package="plm")
data(usaww)
usalw <- mat2listw(usaww)
fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp+slag(log(pcap),
  listw=usalw)
slxmod <- spreml(fm, data=Produc, w = usaww,
  model="pooling", lag=FALSE, errors="ols")



