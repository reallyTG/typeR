library(diffusionMap)


### Name: diffusionKmeans
### Title: Diffusion K-means
### Aliases: diffusionKmeans
### Keywords: multivariate nonparametric

### ** Examples

library(scatterplot3d)

## example with annulus data set
data(annulus)
par(mfrow=c(2,1))
plot(annulus,main="Annulus Data",pch=20,cex=.7)
D = dist(annulus) # use Euclidean distance
dmap = diffuse(D,eps.val=0.05) # compute diffusion map
k=2  # number of clusters
dkmeans = diffusionKmeans(dmap, k)
plot(annulus,main="Colored by diffusion K-means clustering",pch=20,
   cex=.7,col=dkmeans$part)
table(dkmeans$part,c(rep(1,500),rep(2,500)))


## example with Chainlink data set
data(Chainlink)
lab.col = c(rep("red",500),rep("blue",500)); n=1000
scatterplot3d(Chainlink$C1,Chainlink$C2,Chainlink$C3,color=lab.col,
   main="Chainlink Data") # plot Chainlink data
D = dist(Chainlink) # use Euclidean distance
dmap = diffuse(D,neigen=3,eps.val=.01) # compute diffusion map & plot
plot(dmap)
dkmeans = diffusionKmeans(dmap, K=2)
col.dkmeans=ifelse(dkmeans$part==1,"red","blue")
scatterplot3d(Chainlink,color=col.dkmeans,
   main="Chainlink Data, colored by diff. K-means class")
table(dkmeans$part,lab.col)





