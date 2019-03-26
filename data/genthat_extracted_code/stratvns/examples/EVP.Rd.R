library(stratvns)


### Name: EVP
### Title: Optimization Algorithm to solve stratification problem
### Aliases: EVP

### ** Examples

data(Sweden)
P75<-Sweden[,3]
solution1<-EVP(P75,L=2,cv=0.1,nhmin=5,imax=50,cores=2)
solution2<-EVP(P75,L=6,cv=0.1,cores=2,imax=25)



