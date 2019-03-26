library(DTDA)


### Name: efron.petrosian
### Title: Doubly truncated data analysis with the first Efron-Petrosian
###   algorithm
### Aliases: efron.petrosian
### Keywords: iteration nonparametric

### ** Examples

##  Generating data which are doubly truncated

n<-25
X<-runif(n,0,1)
U<-runif(n,0,0.5)
V<-runif(n,0.5,1)

for (i in 1:n){
	while (X[i]<U[i]|X[i]>V[i]){
	U[i]<-runif(1,0,0.5)
	X[i]<-runif(1,0,1)
	V[i]<-runif(1,0.5,1)
					   }
		 }
efron.petrosian(X=X,U=U,V=V,boot=FALSE,display.F=TRUE,display.S=TRUE)





