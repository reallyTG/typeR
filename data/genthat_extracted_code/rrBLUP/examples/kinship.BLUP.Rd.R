library(rrBLUP)


### Name: kinship.BLUP
### Title: Genomic prediction by kinship-BLUP (deprecated)
### Aliases: kinship.BLUP

### ** Examples

#random population of 200 lines with 1000 markers
G <- matrix(rep(0,200*1000),200,1000)
for (i in 1:200) {
  G[i,] <- ifelse(runif(1000)<0.5,-1,1)
}

#random phenotypes
g <- as.vector(crossprod(t(G),rnorm(1000)))
h2 <- 0.5 
y <- g + rnorm(200,mean=0,sd=sqrt((1-h2)/h2*var(g)))

#split in half for training and prediction
train <- 1:100
pred <- 101:200
ans <- kinship.BLUP(y=y[train],G.train=G[train,],G.pred=G[pred,],K.method="GAUSS")

#correlation accuracy
r.gy <- cor(ans$g.pred,y[pred])



