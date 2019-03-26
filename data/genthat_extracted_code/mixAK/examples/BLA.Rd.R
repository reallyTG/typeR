library(mixAK)


### Name: BLA
### Title: Best linear approximation with respect to the mean square error
###   (theoretical linear regression).
### Aliases: BLA C_BLA
### Keywords: multivariate

### ** Examples

##### X = (U(1), U(2), U(3))'
##### * U(1) <= U(2) <= U(3)
##### * ordered uniform Unif(0, 1) variates
EX <- (1:3)/4
varX <- matrix(c(3,2,1, 2,4,2, 1,2,3), ncol=3)/80
BLA(EX, Sigma=varX)


##### Uroda sena
##### * Y1 = uroda sena [cent/akr]
##### * Y2 = jarni srazky [palce]
##### * Y3 = kumulovana teplota nad 42 F
EY <- c(28.02, 4.91, 28.7)
varY <- matrix(c(19.54, 3.89, -3.76,  3.89, 1.21, -1.31,  -3.76, -1.31, 4.52), ncol=3)
BLA(EY, Sigma=varY)


##### Z=(X, Y) ~ uniform distribution on a triangle
##### M = {(x,y): x>=0, y>=0, x+y<=3}
EZ <- c(1, 1)
varZ <- matrix(c(2, -1,  -1, 2), nrow=2)/4
BLA(EZ, Sigma=varZ)


##### W=(X, Y) ~ uniform distribution on
##### M = {(x,y): x>=0, 0<=y<=1, y<=x<=y+1}
EW <- c(1, 1/2)
varW <- matrix(c(2, 1,  1, 1), nrow=2)/12
BLA(EW, Sigma=varW)



