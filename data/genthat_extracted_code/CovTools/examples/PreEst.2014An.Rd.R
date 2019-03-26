library(CovTools)


### Name: PreEst.2014An
### Title: Banded Precision Matrix Estimation via Bandwidth Test
### Aliases: PreEst.2014An

### ** Examples

## Not run: 
##D ## parameter setting
##D p = 200; n = 100
##D k0 = 5; A0min=0.1; A0max=0.2; D0min=2; D0max=5
##D 
##D set.seed(123)
##D A0 = matrix(0, p,p)
##D for(i in 2:p){
##D   term1 = runif(n=min(k0,i-1),min=A0min, max=A0max)
##D   term2 = sample(c(1,-1),size=min(k0,i-1),replace=TRUE)
##D   vals  = term1*term2
##D   vals  = vals[ order(abs(vals)) ]
##D   A0[i, max(1, i-k0):(i-1)] = vals
##D }
##D 
##D D0 = diag(runif(n = p, min = D0min, max = D0max))
##D Omega0 = t(diag(p) - A0)%*%diag(1/diag(D0))%*%(diag(p) - A0)
##D 
##D ## data generation (based on AR representation)
##D ## it is same with generating n random samples from N_p(0, Omega0^{-1})
##D X = matrix(0, nrow=n, ncol=p)
##D X[,1] = rnorm(n, sd = sqrt(D0[1,1]))
##D for(j in 2:p){
##D   mean.vec.j = X[, 1:(j-1)]%*%as.matrix(A0[j, 1:(j-1)])
##D   X[,j] = rnorm(n, mean = mean.vec.j, sd = sqrt(D0[j,j]))
##D }
##D 
##D ## banded estimation using two different schemes
##D Omega1 <- PreEst.2014An(X, upperK=20, algorithm="Bonferroni")
##D Omega2 <- PreEst.2014An(X, upperK=20, algorithm="Holm")
##D 
##D ## visualize true and estimated precision matrices
##D par(mfrow=c(1,3), pty="s")
##D image(pracma::flipud(Omega0), main="Original Precision")
##D image(pracma::flipud(Omega1$C), main="banded3::Bonferroni")
##D image(pracma::flipud(Omega2$C), main="banded3::Holm")
## End(Not run)




