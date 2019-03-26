library(diffusionMap)


### Name: nystrom
### Title: Perform Nystrom Extension to estimate diffusion coordinates of
###   data.
### Aliases: nystrom
### Keywords: multivariate nonparametric

### ** Examples

Norig = 1000
Next = 4000
t=runif(Norig+Next)^.7*10
al=.15;bet=.5;
x1=bet*exp(al*t)*cos(t)+rnorm(length(t),0,.1)
y1=bet*exp(al*t)*sin(t)+rnorm(length(t),0,.1)

D = as.matrix(dist(cbind(x1,y1)))
Dorig = D[1:Norig,1:Norig] # training distance matrix
DExt = D[(Norig+1):(Norig+Next),1:Norig] # new data distance matrix
# compute original diffusion map
dmap = diffuse(Dorig,neigen=2) 
 # use Nystrom extension
dmapExt = nystrom(dmap,DExt)
plot(dmapExt[,1:2],pch=8,col=2,
  main="Diffusion map, black = original, red = new data",
  xlab="1st diffusion coefficient",ylab="2nd diffusion coefficient")
points(dmap$X[,1:2],pch=19,cex=.5)




