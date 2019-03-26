library(fCertificates)


### Name: DoubleBarrierBinaryCall
### Title: Double Barrier Binary Call valuation using pricing by
###   duplication
### Aliases: DoubleBarrierBinaryCall InlineWarrant
### Keywords: math

### ** Examples

p <- DoubleBarrierBinaryCall(S=100, K=10, L=80, U=120, T=1, 
   r=0.02, r_d=0, sigma=0.2)
   
# Reproduce Table 4-23 in Haug (2007)
S <- 100
T <- 0.25
L <- c(80, 85, 90, 95)
U <- c(120, 115, 110, 105)
r <- 0.05
b <- 0.03
r_d <- 0.02
K <- 10
sigma <- c(0.1, 0.2, 0.3, 0.5)
p <- matrix(NA, 4, 4)
for (i in 1:4)
{
 for (j in 1:4)
 {
   p[i,j] <- DoubleBarrierBinaryCall(S=S, K=K, L=L[i], U=U[i], T=T, 
     r=r, r_d=r_d, sigma=sigma[j])
 }
}

X=cbind(L, U, p)
colnames(X)=c("L", "U", "sigma=0.1", "sigma=0.2", "sigma=0.3", "sigma=0.5")
X  



