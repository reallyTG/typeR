library(archdata)


### Name: Michelsberg
### Title: Younger Neolithic Pottery from Central Europe
### Aliases: Michelsberg
### Keywords: datasets

### ** Examples

data(Michelsberg)
str(Michelsberg)
names(Michelsberg)[5:39]
attributes(Michelsberg)$typological_key
library(ca)

# geographical distribution
xy <- as.matrix(Michelsberg[,41:42])/1000
plot(xy, asp=1, pch=16, col=rgb(.3,.3,.3,.5))
text(xy[,1], xy[,2], Michelsberg$id, cex=.7, pos=2)
# Note site 109 to the Northeast; 

# preparing the data set for CA
abu <- Michelsberg[, 5:39]
rownames(abu) <- Michelsberg$id

# CA with site 109, Flintbek LA48, as supplementary row
MBK.ca <- ca(abu, ndim=min(dim(abu)-1), suprow=109 )

# asymmetric biplot with row quality and column contribution
plot(MBK.ca, map="rowprincipal", contrib=c("relative", "absolute"))

title(main="Row-isometric Biplot of Michelsberg CA", cex.sub=.7, 
     sub="color intensity represents quality for sites and contributions for types")
# The arch is a curved trend in 3D; zoom with mouse scroll
library(rgl)
plot3d(MBK.ca, map="rowprincipal", labels=c(0,0))



