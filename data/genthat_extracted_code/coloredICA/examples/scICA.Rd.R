library(coloredICA)


### Name: scICA
### Title: spatial colored Independent Component Analysis
### Aliases: scICA

### ** Examples

## Not run:

require(fastICA)

n1=20
n2=20
M=2

# Fist source

sigma1=2
S1=matrix(0,n1,n2)
for (i in 1:n1){
S1[i,]=rnorm(n2,i*2,0.2)
}
for (j in 1:n2){
S1[,j]=S1[,j]+rnorm(n1,j*2,0.2)
}
S1=S1+matrix(rnorm(n1*n2,0,sigma1),n1,n2)

image(1:n2,1:n1,t(S1[n1:1,]),xlab="",ylab="",main="Source 1")
contour(1:n2,1:n1,t(S1[n1:1,]),add=TRUE)

# Second source

val1=1
val2=1.2
val3=1.5
val4=2
sigma2=0.1 

S2=matrix(0,n1,n2)
S2[2:5,4:10]=val1
S2[3:4,5:9]=val3
S2[13:18,16:19]=val2
S2[14:17,17:18]=val4
S2=S2+matrix(rnorm(n1*n2,0,sigma2),n1,n2)

image(1:n2,1:n1,t(S2[n1:1,]),xlab="",ylab="",main="Source 2")
contour(1:n2,1:n1,t(S2[n1:1,]),add=TRUE)

# Generating data matrix X

A = rerow(matrix(runif(M^2)-0.5,M,M))
W = solve(A)
S=rbind(as.vector(S1),as.vector(S2))
X = A %*% S

# Solving Blind Source Separation problem with three different methods

cica = cICA(X,tol=0.001)
## scica = scICA(X,n1=n1,n2=n2,h=(2*pi/10),tol=0.001)
fica = fastICA(t(X),2)

amari_distance(t(A),t(cica$A))
## amari_distance(t(A),t(scica$A))
amari_distance(t(A),fica$A)

Shat1=cica$S
## Shat2=scica$S
Shat3=t(fica$S)

par(mfrow=c(2,2))
image(t(S1[n1:1,]),xlab="",ylab="")
contour(t(S1[n1:1,]),add=TRUE)
image(t(S2[n1:1,]),xlab="",ylab="")
contour(t(S2[n1:1,]),add=TRUE)
image(t(matrix(Shat1[1,],n1,n2)[n1:1,]),xlab="",ylab="")
contour(t(matrix(Shat1[1,],n1,n2)[n1:1,]),add=TRUE)
image(t(matrix(Shat1[2,],n1,n2)[n1:1,]),xlab="",ylab="")
contour(t(matrix(Shat1[2,],n1,n2)[n1:1,]),add=TRUE)

## par(mfrow=c(2,2))
## image(t(S1[n1:1,]),xlab="",ylab="")
## contour(t(S1[n1:1,]),add=TRUE)
## image(t(S2[n1:1,]),xlab="",ylab="")
## contour(t(S2[n1:1,]),add=TRUE)
## image(t(matrix(Shat2[1,],n1,n2)[n1:1,]),xlab="",ylab="")
## contour(t(matrix(Shat2[1,],n1,n2)[n1:1,]),add=TRUE)
## image(t(matrix(Shat2[2,],n1,n2)[n1:1,]),xlab="",ylab="")
## contour(t(matrix(Shat2[2,],n1,n2)[n1:1,]),add=TRUE)

par(mfrow=c(2,2))
image(t(S1[n1:1,]),xlab="",ylab="")
contour(t(S1[n1:1,]),add=TRUE)
image(t(S2[n1:1,]),xlab="",ylab="")
contour(t(S2[n1:1,]),add=TRUE)
image(t(matrix(Shat3[1,],n1,n2)[n1:1,]),xlab="",ylab="")
contour(t(matrix(Shat3[1,],n1,n2)[n1:1,]),add=TRUE)
image(t(matrix(Shat3[2,],n1,n2)[n1:1,]),xlab="",ylab="")
contour(t(matrix(Shat3[2,],n1,n2)[n1:1,]),add=TRUE)

## End (Not run)



