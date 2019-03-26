library(RFOC)


### Name: MomentDist
### Title: Distance Between Moment Tensors
### Aliases: MomentDist
### Keywords: misc

### ** Examples


Mtens = c(-0.412, 0.084, 0.328 ,0.398, -1.239, 1.058)
M1 = matrix(c(Mtens[1], Mtens[4], Mtens[5], Mtens[4], Mtens[2],
Mtens[6], Mtens[5],Mtens[6], Mtens[3]), ncol=3, nrow=3, byrow=TRUE)



Mtens = c(5.054, -2.235, -2.819, -0.476, 5.420, 5.594)
M2 = matrix(c(Mtens[1], Mtens[4], Mtens[5], Mtens[4], Mtens[2],
Mtens[6], Mtens[5],Mtens[6], Mtens[3]), ncol=3, nrow=3, byrow=TRUE)

E1 = eigen(M1)

###  make sure these are a right handed system,
###   ie x1 cross x2 = x3


E2 = eigen(M2)

###  make sure these are a right handed system,
###   ie x1 cross x2 = x3
testrightHAND(E1$vectors) 
testrightHAND(E2$vectors) 

E1$vectors = forcerighthand(E1$vectors)

E2$vectors = forcerighthand(E2$vectors)


testrightHAND(E1$vectors) 
testrightHAND(E2$vectors) 

MomentDist(E1, E2)





