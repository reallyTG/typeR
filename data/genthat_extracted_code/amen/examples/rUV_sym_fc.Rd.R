library(amen)


### Name: rUV_sym_fc
### Title: Gibbs sampling of U and V
### Aliases: rUV_sym_fc

### ** Examples


U0<-matrix(rnorm(30,2),30,2) ; V0<-U0%*%diag(c(3,-2)) 
E<- U0%*%t(V0) + matrix(rnorm(30^2),30,30) 
rUV_sym_fc 




