library(amen)


### Name: el2sm
### Title: Edgelist to sociomatrix
### Aliases: el2sm

### ** Examples


Y<-matrix(rpois(10*10,.5),10,10) ; diag(Y)<-NA
E<-sm2el(Y) 
el2sm(E) - Y 




