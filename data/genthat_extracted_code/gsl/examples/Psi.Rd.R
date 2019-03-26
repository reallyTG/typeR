library(gsl)


### Name: Psi
### Title: Psi (digamma) functions
### Aliases: Psi psi_int psi psi_1piy psi_1_int psi_1 psi_n
### Keywords: array

### ** Examples


x <- seq(from=1.2,to=1.25,by=0.005)
cbind(x,psi(x),psi_1(x))
#tabe 6.1, p267, bottom bit

psi_int(1:6)
psi(pi+(1:6))
psi_1piy(pi+(1:6))
psi_1_int(1:6)
psi_n(m=5,x=c(1.123,1.6523))




