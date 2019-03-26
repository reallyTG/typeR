library(coloredICA)


### Name: cICA
### Title: colored Independent Component Analysis
### Aliases: cICA

### ** Examples

## Not run:

require(fastICA)

T=256
n1=16
n2=16
M=2

S1 = arima.sim(list(order=c(0,0,2),ma=c(1,0.25)),T)
S2 = arima.sim(list(order=c(1,0,0), ar=-0.5),T,rand.gen = function(n, ...) (runif(n)-0.5)*sqrt(3))

A = rerow(matrix(runif(M^2)-0.5,M,M))
W = solve(A)
S=rbind(S1,S2)
X = A %*% S

cica = cICA(X,tol=0.001)
## scica = scICA(X,n1=n1,n2=n2,h=0.8,tol=0.001)
fica = fastICA(t(X),2)

amari_distance(t(A),t(cica$A))
## amari_distance(t(A),t(scica$A))
amari_distance(t(A),fica$A)

Shat1=cica$S
## Shat2=scica$S
Shat3=t(fica$S)

par(mfrow=c(2,2))
plot(S[1,],type="l",lwd=2)
plot(S[2,],type="l",lwd=2)
plot(Shat1[1,],type="l",lwd=2,col="red")
plot(Shat1[2,],type="l",lwd=2,col="red")

## par(mfrow=c(2,2))
## plot(S[1,],type="l",lwd=2)
## plot(S[2,],type="l",lwd=2)
## plot(Shat2[1,],type="l",lwd=2,col="green")
## plot(Shat2[2,],type="l",lwd=2,col="green")

par(mfrow=c(2,2))
plot(S[1,],type="l",lwd=2)
plot(S[2,],type="l",lwd=2)
plot(Shat3[1,],type="l",lwd=2,col="blue")
plot(Shat3[2,],type="l",lwd=2,col="blue")

## End (Not run)



