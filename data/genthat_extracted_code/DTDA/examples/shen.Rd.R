library(DTDA)


### Name: shen
### Title: Doubly truncated data analysis with the Shen algorithm
### Aliases: shen
### Keywords: iteration nonparametric

### ** Examples


##  Generating data which are doubly truncated

n<-25
X<-runif(n,0,1)
U<-runif(n,0,0.67)
V<-runif(n,0.33,1)
for (i in 1:n){
	while (X[i]<U[i]|X[i]>V[i]){
	U[i]<-runif(1,0,0.67)
	X[i]<-runif(1,0,1)
	V[i]<-runif(1,0.33,1)
					}
		}

res<-shen(X,U,V,boot=FALSE, plot.joint=TRUE, plot.type="persp")




