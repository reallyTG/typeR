library(cepp)


### Name: Colon
### Title: Gene expression data from Alon et al. (1999)
### Aliases: Colon
### Keywords: datasets

### ** Examples

# how many samples and how many genes ?
data(Colon)
dim(Colon$X)
norm <- Colon$X[Colon$Y == 1,]
tumor <- Colon$X[Colon$Y == 2,]
gene1 <- pp(r=2,n=50,oth=tumor,data=norm,k=2)
F1  <- basis_random(2000)
gene1(F1)
t1  <- caller(start=F1, index=gene1, n=rep(3,5), bases=5)



