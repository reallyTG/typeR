library(NCutYX)


### Name: muncut
### Title: MuNCut Clusters the Columns of Data from 3 Different Sources.
### Aliases: muncut

### ** Examples

library(NCutYX)
library(MASS)
library(fields) #for image.plot

#parameters#
set.seed(777)
n=50
p=50
h=0.5
rho=0.5

W0=matrix(1,p,p)
W0[1:(p/5),1:(p/5)]=0
W0[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]=0
W0[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)]=0
W0[(4*p/5+1):p,(4*p/5+1):p]=0
W0=cbind(W0,W0,W0)
W0=rbind(W0,W0,W0)

Y=matrix(0,n,p)
Z=matrix(0,n,p)
Sigma=matrix(rho,p,p)
Sigma[1:(p/5),1:(p/5)]=2*rho
Sigma[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]=2*rho
Sigma[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)]=2*rho
Sigma=Sigma-diag(diag(Sigma))
Sigma=Sigma+diag(p)

X=mvrnorm(n,rep(0,p),Sigma)
B1=matrix(0,p,p)
B2=matrix(0,p,p)

B1[1:(p/5),1:(p/5)]=runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.2)
B1[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]=runif((2*p/5)^2,h/2,h)*rbinom((2*p/5)^2,1,0.2)
B1[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)]=runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.2)

B2[1:(p/5),1:(p/5)]=runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.2)
B2[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]=runif((2*p/5)^2,h/2,h)*rbinom((2*p/5)^2,1,0.2)
B2[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)]=runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.2)

Y=X%*%B1+matrix(rnorm(n*p,0,0.5),n,p)
Y2=X%*%B1

Z=Y%*%B2+matrix(rnorm(n*p,0,0.5),n,p)
Z2=Y%*%B2

#Computing our method
clust <- muncut(Z,
                Y,
                X,
                K        = 4,
                B        = 10000,
                L        = 500,
                sampling = 'size',
                alpha    = 0.5,
                ncv      = 3,
                nlambdas = 20,
                sigma    = 10,
                scale    = TRUE,
                model    = FALSE,
                gamma    = 0.1)

A <- clust[[2]][,1]%*%t(clust[[2]][,1])+
     clust[[2]][,2]%*%t(clust[[2]][,2])+
     clust[[2]][,3]%*%t(clust[[2]][,3])+
     clust[[2]][,4]%*%t(clust[[2]][,4])

errorK=sum(A*W0)/(3*p)^2
errorK
plot(clust[[1]],type='l')
image.plot(A)



