library(SAFD)


### Name: hukuhara
### Title: Hukuhara Difference
### Aliases: hukuhara
### Keywords: arith manip

### ** Examples

#Example 1:
Y<-data.frame(x=c(0,0,0,1,2,2),alpha=c(0,0.5,1,1,0.5,0))
X<-data.frame(x=c(0,0,0,0,1.5,2),alpha=c(0,0.5,1,1,0.5,0))
Z<-data.frame(x=c(0,0,0,0.75,1.5,1.5),alpha=c(0,0.5,1,1,0.5,0))
h1<-hukuhara(X,Y,1)
h1
h2<-hukuhara(Z,Y,1)
h2

#Example 2: in this case the hukuhara diff has to exist by construction
data(XX)
X<-translator(XX[[1]],50)
shift<-seq(-1,1,length=100)
Y<-X
Y$x<-X$x+shift
h<-hukuhara(X,Y,1)



