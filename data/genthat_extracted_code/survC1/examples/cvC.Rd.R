library(survC1)


### Name: cvC
### Title: Cross-validation estimate for C
### Aliases: cvC

### ** Examples


D=CompCase(pbc[,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)

tau=365.25*8

model1=D[1:200,c(1,2,4)]

cvC(model1,tau,cvK=2,Rep=10)




