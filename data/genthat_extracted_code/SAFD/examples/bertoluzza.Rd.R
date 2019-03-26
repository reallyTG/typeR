library(SAFD)


### Name: bertoluzza
### Title: Bertoluzza distance
### Aliases: bertoluzza
### Keywords: math manip

### ** Examples

#Example 1:
data(XX)
X<-translator(XX[[1]],50)
Y<-translator(XX[[2]],50)
Z<-translator(XX[[3]],50)
ZZ<-list(X,Y,Z)
b<-bertoluzza(X,Y,1/3,1)
b

#Example 2: example (SLLN for the FRV)
V<-translator(XX[[3]],100)
YY<-vector("list",length=50)
  for(i in 1:50){
   YY[[i]]<-generator(V,,,)
   }
M<-Mmean(YY)
head(M)
b<-bertoluzza(M,V,1/3,1) 
b

#Example 3:
V<-translator(XX[[3]],100)
YY<-vector("list",length=1000)
  for(i in 1:1000){
   YY[[i]]<-generator(V,,,)
   }
M<-Mmean(YY)
head(M)
b<-bertoluzza(M,V,1/3,1)  
b

#Example 4:
X<-data.frame(x=c(0,1,1,2),alpha=c(0,1,1,0))
Y<-data.frame(x=c(0,1,2),alpha=c(0,1,0))
b<-bertoluzza(X,Y,1/3,1)
b

#Example 5:
data(Trees)
X<-Mmean(Trees[[1]])
Y<-Mmean(Trees[[2]])
Z<-Mmean(Trees[[3]])
b1<-bertoluzza(X,Y,1)
b1
b2<-bertoluzza(X,Z,1)
b2
b3<-bertoluzza(Y,Z,1)
b3



