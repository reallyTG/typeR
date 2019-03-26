library(emulator)


### Name: prior.b
### Title: Prior linear fits
### Aliases: prior.b prior.B
### Keywords: models

### ** Examples


# example has 10 observations on 6 dimensions.
# function is just sum( (1:6)*x) where x=c(x_1, ... , x_2)

data(toy)
val <- toy
d <- apply(val,1,function(x){sum((1:6)*x)})

#add some noise:
d <- jitter(d)

A <- corr.matrix(val,scales=rep(1,ncol(val)))
Ainv <- solve(A)
H <- regressor.multi(val)

prior.b(H,Ainv,d)
prior.B(H,Ainv)



