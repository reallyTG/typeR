library(gmm)


### Name: tsls
### Title: Two stage least squares estimation
### Aliases: tsls

### ** Examples


n <- 1000
e <- arima.sim(n,model=list(ma=.9))
C <- runif(n,0,5)
Y <- rep(0,n)
Y[1] = 1 + 2*C[1] + e[1]
for (i in 2:n){
Y[i] = 1 + 2*C[i] + 0.9*Y[i-1] + e[i]
}
Yt <- Y[5:n]
X <- cbind(C[5:n],Y[4:(n-1)])
Z <- cbind(C[5:n],Y[3:(n-2)],Y[2:(n-3)],Y[1:(n-4)]) 

res <- tsls(Yt~X,~Z)
res




