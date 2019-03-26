library(MFT)


### Name: MFT.m_est
### Title: MFT.m_est
### Aliases: MFT.m_est

### ** Examples

# 1. Independent life times (m=0)
set.seed(117)
n <- 5000
Phi1 <- cumsum(rexp(n,3.5))
Phi2 <- cumsum(rexp(n,5))
Phi3 <- cumsum(rexp(n,2))
Phi  <- c(Phi1[Phi1<=200],Phi2[Phi2>200 & Phi2<400],Phi3[Phi3>400 & Phi3<700])
MFT.m_est(Phi)

# 2. Point process simulated according to model
# X_i = a_0 X_i + a_1 X_{i-1} + ... a_m X_{i-m}
# with life times X_i gamma-distributed, 2 change points and true m = 3.
set.seed(210)
Tt <- 3000
m <- 3
a <- c(1,0.5,0.25,0.125)
mu <- c(0.5,1,2)/(sum(a))
sigmaX <- sqrt(0.225/(sum(a^2)))
shape <- mu^2/sigmaX^2; rate <- mu/sigmaX^2
len <- 10000
# build auxiliary processes
X1 <- rgamma(len,rate=rate[1],shape=shape[1]); M1 <- embed(X1,m+1)
v1 <- cumsum(as.vector(M1 %*% a)); v1 <- v1[v1<Tt]
X2 <- rgamma(len,rate=rate[2],shape=shape[2]); M2 <- embed(X2,m+1)
v2 <- cumsum(as.vector(M2 %*% a)); v2 <- v2[v2<Tt]
X3 <- rgamma(len,rate=rate[3],shape=shape[3]); M3 <- embed(X3,m+1)
v3 <- cumsum(as.vector(M3 %*% a)); v3 <- v3[v3<Tt]
# build final point process with cps at 100 and 200
Phi <- c(v1[v1<Tt/3],v2[v2>Tt/3 & v2<(2/3)*Tt],v3[v3>(2/3)*Tt])
# estimate m
MFT.m_est(Phi)




