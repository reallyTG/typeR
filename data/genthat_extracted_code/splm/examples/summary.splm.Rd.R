library(splm)


### Name: summary.splm
### Title: summary method for class splm
### Aliases: summary.splm
### Keywords: spatial

### ** Examples

data(Produc, package = "plm") 
data(usaww)
GM <- spgm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc,
            listw=usaww, moments = "fullweights", spatial.error = TRUE)
summary(GM)



