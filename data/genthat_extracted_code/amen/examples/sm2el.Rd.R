library(amen)


### Name: sm2el
### Title: Sociomatrix to edgelist
### Aliases: sm2el

### ** Examples


Y<-matrix(rpois(10*10,.5),10,10) ; diag(Y)<-NA
E<-sm2el(Y) 
el2sm(E) - Y 




