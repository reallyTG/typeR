library(MPkn)


### Name: MPkn-package
### Title: Calculations of One Discrete Model in Several Time Steps
### Aliases: MPkn-package

### ** Examples

require(MPkn)
require(markovchain)
options(digits = 14)
n = 12
k = 2
rz = 11
P = array(0, c(rz, rz))
for (i in 1:rz){
  po = runif(rz)
  P[i, ] = po/sum(po)
}
I = diag(1, rz, rz)
Myy = MUPkL(P, P, I, n, k, c(1:rz))
StSy = NULL
for (i in 1:rz) StSy = c(StSy, Myy$Navg[,,i][n])
mrkv = new("markovchain", transitionMatrix = P)
StSx = steadyStates(mrkv)
print("MPkn");  print(StSy)
print("markovchain"); print(StSx)




