library(survC1)


### Name: Est.Cval
### Title: Esimtation of C
### Aliases: Est.Cval

### ** Examples


D=CompCase(pbc[1:200,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)
tau=365.25*8
model=D[,c(1,2,4,5)]

Est.Cval(model, tau)$Dhat




