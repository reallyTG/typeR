library(emulator)


### Name: s.chi
### Title: Variance estimator
### Aliases: s.chi
### Keywords: models

### ** Examples


# example has 10 observations on 6 dimensions.
# function is just sum( (1:6)*x) where x=c(x_1, ... , x_2)
data(toy)
val <- toy
colnames(val) <- letters[1:6]
H <- regressor.multi(val)
d <- apply(H,1,function(x){sum((0:6)*x)})


# create A matrix and its inverse:
A <- corr.matrix(val,scales=rep(1,ncol(val)))
Ainv <- solve(A)

# add some suitably correlated noise:
d <- as.vector(rmvnorm(n=1, mean=d, 0.1*A))

# now evaluate s.chi():
s.chi(H, Ainv, d)


# assess accuracy:
s.chi(H, Ainv, d, fast=TRUE) - s.chi(H, Ainv, d, fast=FALSE)




