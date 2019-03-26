## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,eval=TRUE,fig.align="center",fig.width = 7,fig.height = 6)

## ------------------------------------------------------------------------
library(ClustGeo)
data(estuary)
dat <- estuary$dat
head(dat)
D.geo <- estuary$D.geo
map <- estuary$map

## ------------------------------------------------------------------------
n <- nrow(dat)
D <- dist(dat)
Delta <- D^2/(2*n)
tree <- hclust(Delta,method="ward.D")

## ------------------------------------------------------------------------
?inertdiss #pseudo inertia when dissimilarities are non euclidean
?inert #standard inertia otherwise
inertdiss(D) #pseudo inertia
inert(dat) # inertia
sum(tree$height)

## ------------------------------------------------------------------------
tree <- hclustgeo(D)
sum(tree$height)

## ------------------------------------------------------------------------
map <- estuary$map
wt <- map@data$POPULATION # non uniform weights
# with hclust
Delta <-  D               
for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    Delta[n*(i-1) - i*(i-1)/2 + j-i] <-
        Delta[n*(i-1) - i*(i-1)/2 + j-i]^2*wt[i]*wt[j]/(wt[i]+wt[j]) }}
tree <- hclust(Delta,method="ward.D",members=wt)
sum(tree$height)

#with hclustgeo
tree <- hclustgeo(D,wt=wt)
sum(tree$height)

## ------------------------------------------------------------------------
library(ClustGeo)
data(estuary)
dat <- estuary$dat
D.geo <- estuary$D.geo
map <- estuary$map 

D0 <- dist(dat) # the socio-demographic distances
tree <- hclustgeo(D0)
plot(tree,hang=-1,label=FALSE, xlab="",sub="",
     main="Ward dendrogram with D0 only",cex.main=0.8,cex=0.8,cex.axis=0.8,cex.lab=0.8)
#plot(tree,hang=-1,xlab="",sub="",main="Ward dendrogram with D0 only",
#      cex.main=0.8,cex=0.8,labels=city_label,cex.axis=0.8,cex.lab=0.8)
rect.hclust(tree,k=5,border=c(4,5,3,2,1))
legend("topright", legend= paste("cluster",1:5), fill=1:5, cex=0.8,bty="n",border="white")

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  postscript("dendroD0.eps")
#  #plot(tree,hang=-1,label=FALSE, xlab="",sub="",
#  #    cex=0.8,cex.axis=0.8,cex.lab=0.8,main="")
#  plot(tree,hang=-1,label=FALSE, xlab="",sub="", main="")
#  rect.hclust(tree,k=5,border=c(4,5,3,2,1))
#  legend("topright", legend= paste("cluster",1:5), fill=1:5,bty="n",border="white")
#  dev.off()

## ------------------------------------------------------------------------
# the map of the cities is an object of class "SpatialPolygonsDataFrame"
class(map)
# the object map contains several informations
names(map)
head(map@data[,4:8])
# we check that the cities in map are the same than those in X
identical(as.vector(map$"INSEE_COM"),rownames(dat))

# now we plot the cities on the map with the name of four cities
city_label <- as.vector(map$"NOM_COMM")
sp::plot(map,border="grey")
text(sp::coordinates(map)[c(54,99,117,116),],labels=city_label[c(54,99,117,116)],cex=0.8)

## ------------------------------------------------------------------------
# cut the dendrogram to get the partition in 5 clusters
P5 <- cutree(tree,5)
names(P5) <- city_label
sp::plot(map,border="grey",col=P5,main="5 clusters partition obtained with D0 only",cex.main=0.8)
legend("topleft", legend=paste("cluster",1:5), fill=1:5, cex=0.8,bty="n",border="white")

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  postscript("map-P5.eps")
#  sp::plot(map,border="grey",col=P5)
#  #legend(locator(1), legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  legend("topleft", inset=0.2,legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  dev.off()

## ------------------------------------------------------------------------
# list of the cities in cluster 5
city_label[which(P5==5)]
#plot(map,border="grey")
#text(coordinates(map)[which(P5==5),],labels=city_label[which(P5==5)],cex=0.8)

## ------------------------------------------------------------------------
D1 <- as.dist(D.geo) # the geographic distances between the cities
# 

## ------------------------------------------------------------------------
range.alpha <- seq(0,1,0.1)
K <- 5
cr <- choicealpha(D0,D1,range.alpha,K,graph=TRUE)
cr$Q # proportion of explained pseudo inertia
cr$Qnorm # normalized proportion of explained pseudo inertia
?plot.choicealpha
#plot(cr,norm=TRUE)

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  #postscript("plotQ-1.eps",width = 950,height = 489)
#  plot(cr)
#  #dev.off()
#  #postscript("plotQnorm-1.eps")
#  plot(cr,norm=TRUE)
#  #dev.off()

## ------------------------------------------------------------------------
tree <- hclustgeo(D0,D1,alpha=0.2)
P5bis <- cutree(tree,5)

## ----fig.align="center"--------------------------------------------------
tree <- hclustgeo(D0,D1,alpha=0.2)
P5bis <- cutree(tree,5)
sp::plot(map,border="grey",col=P5bis, main="5 clusters partition obtained \n with alpha=0.2 and geographical distances",cex.main=0.8)
legend("topleft", legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  postscript("map-P5bis.eps")
#  sp::plot(map,border="grey",col=P5bis)
#  #legend(locator(1), legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  legend("topleft", inset=0.2,legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  dev.off()

## ----fig.height=4,fig.width=4,fig.align="center",warning=FALSE,message=FALSE----
#library(spdep)
list.nb <- spdep::poly2nb(map,row.names = rownames(dat)) #list of neighbours of each city
city_label[list.nb[[117]]] # list of the neighbours of BORDEAUX

A <- spdep::nb2mat(list.nb,style="B")
diag(A) <- 1
colnames(A) <- rownames(A) <- city_label
A[1:5,1:5]

## ------------------------------------------------------------------------
D1 <- as.dist(1-A)

## ------------------------------------------------------------------------
cr <- choicealpha(D0,D1,range.alpha,K,graph=TRUE)
cr$Q # proportion of explained pseudo inertia
cr$Qnorm # normalized proportion of explained pseudo inertia

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  #postscript("plotQ-1.eps",width = 950,height = 489)
#  plot(cr)
#  #dev.off()
#  #postscript("plotQnorm-1.eps")
#  plot(cr,norm=TRUE)
#  #dev.off()

## ------------------------------------------------------------------------
tree <- hclustgeo(D0,D1,alpha=0.2)
P5ter <- cutree(tree,5)
sp::plot(map,border="grey",col=P5ter, main="5 clusters partition obtained with \n alpha=0.2 and neighbours dissimilarities",cex.main=0.8)
legend("topleft", legend=paste("cluster",1:5), fill=1:5, bty="n",border="white",cex=0.8)

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  postscript("map-P5ter.eps")
#  sp::plot(map,border="grey",col=P5ter)
#  #legend(locator(1), legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  legend("topleft", inset=0.2,legend=paste("cluster",1:5), fill=1:5, bty="n",border="white")
#  dev.off()

## ------------------------------------------------------------------------
tree <- hclustgeo(D0,D1,alpha=0.2)
P5bis <- cutree(tree,5)
sp::plot(map,border="grey",col=P5bis, main="5 clusters partition obtained with \n alpha=0.2 and neighborhood dissimilarities",cex.main=0.8)
legend("topleft", legend=1:5, fill=1:5, col=P5,cex=0.8)

## ------------------------------------------------------------------------
range.alpha <- seq(0,1,0.1)
K <- 5
cr <- choicealpha(D0,D1,range.alpha,K,graph=FALSE)
?plot.choicealpha
plot(cr,cex=0.8,norm=FALSE,cex.lab=0.8,ylab="pev",col=3:4,legend=c("socio-demo","geo"),
     xlab="mixing parameter")

## ------------------------------------------------------------------------
plot(cr,cex=0.8,norm=TRUE,cex.lab=0.8,ylab="pev",col=5:6,pch=5:6,legend=c("socio-demo","geo"),
     xlab="mixing parameter")

