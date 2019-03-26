library(asht)


### Name: tukeyWelsch
### Title: Tukey-Welsch Pairwise Tests
### Aliases: tukeyWelsch
### Keywords: htest

### ** Examples

##
createData<-function(n,props,shifts,ry=rnorm){
  k<-length(props)
  if (round(sum(props),8)!=1) stop("sum of props must be 1")
  props<- props/sum(props)
  if (length(shifts)!=k) stop("length of shifts must equal length of props")
  g<-rep(1:k,as.vector(rmultinom(1,n,props)))
  y<-ry(n)
  for (i in 1:k){
    y[g==i]<-y[g==i]+shifts[i]
    }
  list(y=y,g=g)
}
set.seed(1)
d<-createData(100,c(.2,.3,.2,.3),c(0,0,0,1))
tukeyWelsch(d$y,factor(d$g),method="kw")
tukeyWelsch(d$y,factor(d$g),method="aov")
tukeyWelsch(d$y,factor(d$g),method="sr")
TukeyHSD(aov(d$y~factor(d$g)))[[1]][,"p adj"]




