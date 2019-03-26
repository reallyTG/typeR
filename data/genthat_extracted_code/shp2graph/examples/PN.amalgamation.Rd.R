library(shp2graph)


### Name: PN.amalgamation
### Title: Amalgamate edges connected by a pseudo-node
### Aliases: PN.amalgamation Minus.DegreeL Update.nodelist Update.edgelist
###   extend.eadf is.exception
### Keywords: pseudo, node

### ** Examples

data(ORN)
rtNEL<-readshpnw(ORN.nt, ELComputed=TRUE)
res.sl<-SL.extraction(rtNEL[[2]],rtNEL[[3]])
res.me<-ME.simplification(res.sl[[1]],res.sl[[2]],DegreeL=res.sl[[4]]) 
res.pn<-PN.amalgamation(res.me[[1]],res.me[[2]],DegreeL=res.me[[4]])
ptcoords<-Nodes.coordinates(res.pn[[1]])
#plot(ORN.nt)
#points(ptcoords, col="green")
#plot(ORN.nt)
#points(Nodes.coordinates(rtNEL[[2]]), col="red")



