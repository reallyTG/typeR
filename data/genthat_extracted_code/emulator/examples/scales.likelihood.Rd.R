library(emulator)


### Name: scales.likelihood
### Title: Likelihood of roughness parameters
### Aliases: scales.likelihood
### Keywords: array

### ** Examples

 data(toy)
 val <- toy

 #define a real relation
 real.relation <- function(x){sum( (0:6)*x )}

 #Some scales:
 fish <- rep(1,6)
 fish[6] <- 4
 A <- corr.matrix(val,scales=fish)
 Ainv <- solve(A)

 # Gaussian process noise:
 H <- regressor.multi(val)
 d <- apply(H,1,real.relation)
 d.noisy <- as.vector(rmvnorm(n=1,mean=d, 0.1*A))

 # Compare likelihoods with true values and another value:
 scales.likelihood(scales=rep(1,6),xold=toy,d=d.noisy)
 scales.likelihood(scales=fish    ,xold=toy,d=d.noisy)


 # Verify that use.Ainv does not affect the numerical result:
u.true  <- scales.likelihood(scales=rep(1,6),xold=toy,d=d.noisy,use.Ainv=TRUE)
u.false <- scales.likelihood(scales=rep(1,6),xold=toy,d=d.noisy,use.Ainv=FALSE)
print(c(u.true, u.false))  # should be identical up to numerical accuracy


 # Now use optim():
 f <- function(fish){scales.likelihood(scales=exp(fish), xold=toy, d=d.noisy)}
 e <-
optim(log(fish),f,method="Nelder-Mead",control=list(trace=0,maxit=10,fnscale=
-1))
best.scales <- exp(e$par)




