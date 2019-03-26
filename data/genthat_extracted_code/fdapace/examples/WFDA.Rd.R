library(fdapace)


### Name: WFDA
### Title: Warped Functional DAta Analysis
### Aliases: WFDA

### ** Examples

N = 44;
eps = 0.123;
M = 41;
set.seed(123) 
Tfinal = 3
me <- function(t) exp(-Tfinal*(((t/Tfinal^2)-0.5))^2);
T = seq(0,Tfinal,length.out = M) 
recondingTimesMat = matrix(nrow = N, ncol = M)
yMat = matrix(nrow = N, ncol = M)

for (i in 1:N){
  peak = runif(min = 0.2,max =  0.8,1) * Tfinal 
  recondingTimesMat[i,] = sort( unique(c( seq(0.0 , peak, length.out = round((M+1)/2)),
                            seq( peak, Tfinal, length.out = round((M+1)/2))))) * Tfinal
  yMat[i,] = me(recondingTimesMat[i,]) * rnorm(1, mean=4.0, sd=  eps)
                                       + rnorm(M, mean=0.0, sd=  eps) 
}

Y = as.list(as.data.frame(t(yMat)))
X = rep(list(T),N)
 
sss =  WFDA(Ly = Y, Lt = X, list( choice = 'weighted' ))
par(mfrow=c(1,2))
matplot(x= T, t(yMat), t='l', main = 'Raw', ylab = 'Y'); grid()
matplot(x= T, t(sss$aligned), t='l', main = 'Aligned', ylab='Y'); grid() 



