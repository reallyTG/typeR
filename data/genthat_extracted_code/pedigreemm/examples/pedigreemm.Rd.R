library(pedigreemm)


### Name: pedigreemm
### Title: Fit mixed-effects models incorporating pedigrees
### Aliases: pedigreemm
### Keywords: models

### ** Examples


  p1 <- new("pedigree",
           sire = as.integer(c(NA,NA,1, 1,4,5)),
           dam  = as.integer(c(NA,NA,2,NA,3,2)),
           label = as.character(1:6))
  A<-getA(p1)
  cholA<-chol(A)  
  varU<-0.4; varE<-0.6; rep<-20
  n<-rep*6
  set.seed(108)
  bStar<- rnorm(6, sd=sqrt(varU))
  b<-crossprod(as.matrix(cholA),bStar)
  ID <- rep(1:6, each=rep)
  e0<-rnorm(n, sd=sqrt(varE))
  y<-b[ID]+e0
  fm1 <- pedigreemm(y ~ (1|ID) , pedigree = list(ID = p1))
  table(y01<-ifelse(y<1.3,0,1))
  fm2 <- pedigreemm(y01 ~ (1|ID) , pedigree = list(ID = p1), family = 'binomial')



