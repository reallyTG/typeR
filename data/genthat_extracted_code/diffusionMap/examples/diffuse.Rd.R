library(diffusionMap)


### Name: diffuse
### Title: Compute diffusion map coordinates from pair-wise distances.
### Aliases: diffuse
### Keywords: multivariate nonparametric

### ** Examples


## example with noisy spiral
n=2000
t=runif(n)^.7*10
al=.15;bet=.5;
x1=bet*exp(al*t)*cos(t)+rnorm(n,0,.1)
y1=bet*exp(al*t)*sin(t)+rnorm(n,0,.1)
plot(x1,y1,pch=20,main="Noisy spiral")
D = dist(cbind(x1,y1))
dmap = diffuse(D,neigen=10) # compute diffusion map
par(mfrow=c(2,1))
plot(t,dmap$X[,1],pch=20,axes=FALSE,xlab="spiral parameter",ylab="1st diffusion coefficient")
box()
plot(1:10,dmap$eigenmult,typ='h',xlab="diffusion map dimension",ylab="eigen-multipliers")

## example with annulus data set
data(annulus)
plot(annulus,main="Annulus Data",pch=20,cex=.7)
D = dist(annulus) # use Euclidean distance
dmap = diffuse(D,eps.val=.1) # compute diffusion map & plot
print(dmap)
plot(dmap)



