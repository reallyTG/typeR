library(diffusionMap)


### Name: distortionMin
### Title: Distortion Minimization via K-means
### Aliases: distortionMin
### Keywords: multivariate nonparametric

### ** Examples

data(annulus)
n = dim(annulus)[1]
D = dist(annulus) # use Euclidean distance
dmap = diffuse(D,0.03) # compute diffusion map 
km = distortionMin(dmap$X,dmap$phi0,2,dmap$X[sample(n,2),])
plot(annulus,col=km$S,pch=20)
table(km$S,c(rep(1,500),rep(2,500)))




