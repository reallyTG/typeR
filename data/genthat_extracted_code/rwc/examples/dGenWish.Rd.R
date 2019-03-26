library(rwc)


### Name: dGenWish
### Title: Density of the (singular) Generalized Wishart distribution
### Aliases: dGenWish
### Keywords: ~kwd1 ~kwd2

### ** Examples

ras=raster(nrow=30,ncol=30)
extent(ras) <- c(0,30,0,30)
values(ras) <- 1
int=ras
cov.ras=ras

## get precision matrix of entire graph
B.int=get.TL(int)
Q.int=get.Q(B.int,1)

## get precision at a few nodes
Phi=get.Phi(Q.int,obs.idx=1:20)
S=ginv(as.matrix(Phi))

## simulate distance matrix
Dsim=rGenWish(df=20,Sigma=S)
image(Dsim)

## calculate log-likelihood
ll=dGenWish(Dsim,S,df=20,log=TRUE)
ll



