library(NCutYX)


### Name: mlbncut
### Title: The MLBNCut Clusters the Columns and the Rows Simultaneously of
###   Data from 3 Different Sources.
### Aliases: mlbncut

### ** Examples

#This sets up the initial parameters for the simulation.
library(NCutYX)
library(MASS)
library(fields)

n   <- 50
p   <- 50
h   <- 0.15
rho <- 0.15
mu  <- 1

W0 <- matrix(1,p,p)
W0[1:(p/5),1:(p/5)] <- 0
W0[(p/5+1):(3*p/5),(p/5+1):(3*p/5)] <- 0
W0[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- 0
W0[(4*p/5+1):p,(4*p/5+1):p]=0
W0=cbind(W0,W0,W0)
W0=rbind(W0,W0,W0)

W1 <- matrix(1,n,n)
W1[1:(n/2),1:(n/2)] <- 0
W1[(n/2+1):n,(n/2+1):n] <- 0

X <- matrix(0,n,p)
Y <- matrix(0,n,p)
Z <- matrix(0,n,p)

Sigma=matrix(0,p,p)
Sigma[1:(p/5),1:(p/5)] <- rho
Sigma[(p/5+1):(3*p/5),(p/5+1):(3*p/5)] <- rho
Sigma[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- rho
Sigma[(4*p/5+1):p,(4*p/5+1):p] <- rho
Sigma <- Sigma - diag(diag(Sigma))
Sigma <- Sigma + diag(p)

X[1:(n/2),]   <- mvrnorm(n/2,rep(mu,p),Sigma)
X[(n/2+1):n,] <- mvrnorm(n/2,rep(-mu,p),Sigma)

B11 <- matrix(0,p,p)
B12 <- matrix(0,p,p)
B21 <- matrix(0,p,p)
B22 <- matrix(0,p,p)

B11[1:(p/5),1:(p/5)]                     <- runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.5)
B11[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]     <- runif((2*p/5)^2,h/2,h)*rbinom((2*p/5)^2,1,0.5)
B11[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.5)
B11[(4*p/5+1):p,(4*p/5+1):p]             <- runif((1*p/5)^2,h/2,h)*rbinom((1*p/5)^2,1,0.5)

B12[1:(p/5),1:(p/5)]                     <- runif((p/5)^2,-h,-h/2)*rbinom((p/5)^2,1,0.5)
B12[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]     <- runif((2*p/5)^2,-h,-h/2)*rbinom((2*p/5)^2,1,0.5)
B12[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- runif((p/5)^2,-h,-h/2)*rbinom((p/5)^2,1,0.5)
B12[(4*p/5+1):p,(4*p/5+1):p]             <- runif((1*p/5)^2,-h,-h/2)*rbinom((1*p/5)^2,1,0.5)

B21[1:(p/5),1:(p/5)]                     <- runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.5)
B21[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]     <- runif((2*p/5)^2,h/2,h)*rbinom((2*p/5)^2,1,0.5)
B21[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- runif((p/5)^2,h/2,h)*rbinom((p/5)^2,1,0.5)
B21[(4*p/5+1):p,(4*p/5+1):p]             <- runif((1*p/5)^2,h/2,h)*rbinom((1*p/5)^2,1,0.5)

B22[1:(p/5),1:(p/5)]                     <- runif((p/5)^2,-h,-h/2)*rbinom((p/5)^2,1,0.5)
B22[(p/5+1):(3*p/5),(p/5+1):(3*p/5)]     <- runif((2*p/5)^2,-h,-h/2)*rbinom((2*p/5)^2,1,0.5)
B22[(3*p/5+1):(4*p/5),(3*p/5+1):(4*p/5)] <- runif((p/5)^2,-h,-h/2)*rbinom((p/5)^2,1,0.5)
B22[(4*p/5+1):p,(4*p/5+1):p]             <- runif((1*p/5)^2,-h,-h/2)*rbinom((1*p/5)^2,1,0.5)

Y[1:(n/2),]   <- X[1:(n/2),]%*%B11+matrix(rnorm((n/2)*p,0,0.25),n/2,p)
Y[(n/2+1):n,] <- X[(n/2+1):n,]%*%B12+matrix(rnorm((n/2)*p,0,0.25),n/2,p)

Z[1:(n/2),]   <- Y[1:(n/2),]%*%B21+matrix(rnorm((n/2)*p,0,0.25),n/2,p)
Z[(n/2+1):n,] <- Y[(n/2+1):n,]%*%B22+matrix(rnorm((n/2)*p,0,0.25),n/2,p)

trial <- mlbncut(Z,
                 Y,
                 X,
                 K=4,
                 R=2,
                 B=10,
                 N=50,
                 dist='correlation',
                 q0=0.15,
                 scale=TRUE,
                 sigmas=0.05,
                 sigmac=1)

plot(trial[[1]],type='l')
image.plot(trial[[2]])
image.plot(trial[[3]])

errorK <- sum((trial[[3]][,1]%*%t(trial[[3]][,1]) +
                 trial[[3]][,2]%*%t(trial[[3]][,2]) +
                 trial[[3]][,3]%*%t(trial[[3]][,3]) +
                 trial[[3]][,4]%*%t(trial[[3]][,4]))*W0)/(3*p)^2 +
            sum((trial[[2]][,1]%*%t(trial[[2]][,1]) +
                 trial[[2]][,2]%*%t(trial[[2]][,2]))*W1)/(n)^2
errorK



