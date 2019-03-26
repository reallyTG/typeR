library(survC1)


### Name: Inf.Cval.Delta
### Title: Inference of Delta C
### Aliases: Inf.Cval.Delta

### ** Examples


D=CompCase(pbc[1:200,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)


model0<-D[,c(1:2,4:5)] ; 
model1<-D
covs1<-as.matrix(model1[,c(-1,-2)])
covs0<-as.matrix(model0[,c(-1,-2)])

tau=365.25*8

Delta=Inf.Cval.Delta(model0[,1:2], covs0, covs1, tau, itr=200)
round(Delta, digits=3)



