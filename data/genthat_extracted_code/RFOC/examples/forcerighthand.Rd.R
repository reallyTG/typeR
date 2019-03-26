library(RFOC)


### Name: forcerighthand
### Title: Force Right-Hand System
### Aliases: forcerighthand
### Keywords: misc

### ** Examples


Mtens = c(-0.412, 0.084, 0.328 ,0.398, -1.239, 1.058)
M1 = matrix(c(Mtens[1], Mtens[4], Mtens[5], Mtens[4], Mtens[2],
Mtens[6], Mtens[5],Mtens[6], Mtens[3]), ncol=3, nrow=3, byrow=TRUE)
E1 = eigen(M1)
testrightHAND(E1$vectors) 

E1$vectors = forcerighthand(E1$vectors) 

testrightHAND(E1$vectors) 





