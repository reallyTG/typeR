library(emulator)


### Name: betahat.fun
### Title: Calculates MLE coefficients of linear fit
### Aliases: betahat.fun betahat.fun.A
### Keywords: models

### ** Examples

data(toy)
val <- toy
H <- regressor.multi(val)
d <- apply(H,1,function(x){sum((0:6)*x)})


fish <- rep(2,6)
A <- corr.matrix(val,scales=fish)
Ainv <- solve(A)

# now add suitably correlated Gaussian noise:
d <-  as.vector(rmvnorm(n=1,mean=d, 0.1*A))

betahat.fun(val , Ainv , d)           # should be close to c(0,1:6)


# Now look at the variances:
betahat.fun(val,Ainv,give.variance=TRUE, d)


     # now find the value of the prior expectation (ie the regression
     # plane) at an unknown point:
x.unknown <- rep(0.5 , 6)
regressor.basis(x.unknown) %*% betahat.fun(val, Ainv, d)

     # compare the prior with the posterior
interpolant(x.unknown, d, val, Ainv,scales=fish)
     # Heh, it's the same!  (of course it is, there is no error here!)


     # OK, put some error on the old observations:
d.noisy <- as.vector(rmvnorm(n=1,mean=d,0.1*A))

     # now compute the regression point:
regressor.basis(x.unknown) %*% betahat.fun(val, Ainv, d.noisy)

     # and compare with the output of interpolant():
interpolant(x.unknown, d.noisy, val, Ainv, scales=fish)
     # there is a difference!



     # now try a basis function that has superfluous degrees of freedom.
     # we need a bigger dataset.  Try 100:
val <- latin.hypercube(100,6)
colnames(val) <- letters[1:6]
d <- apply(val,1,function(x){sum((1:6)*x)})
A <- corr.matrix(val,scales=rep(1,6))
Ainv <- solve(A)

    
betahat.fun(val, Ainv, d, func=function(x){c(1,x,x^2)})
     # should be c(0:6 ,rep(0,6).  The zeroes should be zero exactly
     # because the original function didn't include any squares.


## And finally a sanity check:
f <- function(x){c(1,x,x^2)}
jj1 <- betahat.fun(val, Ainv, d, func=f)
jj2 <- betahat.fun.A(val, A, d, func=f)

abs(jj1-jj2)  # should be small




