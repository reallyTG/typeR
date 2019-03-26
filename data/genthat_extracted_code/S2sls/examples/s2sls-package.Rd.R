library(S2sls)


### Name: S2sls-package
### Title: Spatial Two Stage Least Squares estimation
### Aliases: S2sls-package S2sls

### ** Examples

 # Load data
 data(Produc,package="spanel")
 data(usaww,package="spanel")
 # The contiguity matrix w must be a square matrix with size[nrow(log(gsp)),nrow(log(gsp))]
 # so for our example we transform usaww to a square matrix:
 ww<-as.matrix(usaww)
 h<-kronecker(ww,diag(17))
 # fit spatial two stage least squares model
 ran<-s2sls(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,h)
 summary(ran)



