library(survC1)


### Name: Inf.Cval
### Title: Inference of C
### Aliases: Inf.Cval

### ** Examples


D=CompCase(pbc[1:200,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)

tau=365.25*8

C=Inf.Cval(D, tau, itr=200)
round(c(C$Dhat, C$se, C$low95, C$upp95), digits=3)




