library(DTDA)


### Name: lynden
### Title: Doubly truncated data analysis with the second Efron-Petrosian
###   algorithm
### Aliases: lynden
### Keywords: iteration nonparametric

### ** Examples

#  Generating data which are doubly truncated
n<-25
X<-runif(n,0,1)
U<-runif(n,0,0.25)
V<-runif(n,0.75,1)

for (i in 1:n){
	while (X[i]<U[i]|X[i]>V[i]){
	U[i]<-runif(1,0,0.25)
	X[i]<-runif(1,0,1)
	V[i]<-runif(1,0.75,1)
					   }
		 }
res<-lynden(X=X, U=U, V=V, boot=FALSE, display.F=TRUE, display.S=TRUE)

# Generating data which are right truncated

n<-25
X<-runif(n,0,1)
V<-runif(n,0.75,1)

for (i in 1:n){
	while (X[i]>V[i]){
	X[i]<-runif(1,0,1)
	V[i]<-runif(1,0.75,1)
			     }
		 }
res<-lynden(X=X,U=NA, V=V, boot=FALSE)





