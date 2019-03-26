library(splm)


### Name: spgm
### Title: GM estimation of spatial panel data models
### Aliases: spgm ivsplm spsarargm sperrorgm
### Keywords: spatial

### ** Examples

data(Produc, package = "plm") 
data(usaww)
GM <- spgm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc,
           listw = usaww, moments="fullweights", spatial.error = TRUE)
summary(GM)



