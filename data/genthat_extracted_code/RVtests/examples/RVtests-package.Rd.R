library(RVtests)


### Name: RVtests-package
### Title: Rare Variants Tests
### Aliases: RVtests-package RVtests

### ** Examples

data(sample.cgeno)
str(sample.cgeno) 
x=count2geno(sample.cgeno$cgeno)
dim(x)

set.seed(31018)
y<- rowSums(x[,2:4]*rep(rnorm(3,1,0.1), each=nrow(x))) + 0.4*rnorm(nrow(x))

tmp<- proc.time();RR(x,y,lambda=0:5); proc.time()-tmp
tmp<- proc.time();RR(x,y,weights=c(rep(2,10), rep(1, ncol(x)-10)), lambda=0:5); proc.time()-tmp
tmp<- proc.time();RR(x,y,weights=c(rep(1,10), rep(0, ncol(x)-10)), lambda=0:5); proc.time()-tmp



