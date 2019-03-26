library(penalizedLDA)


### Name: PenalizedLDA.cv
### Title: Perform cross-validation for penalized linear discriminant
###   analysis.
### Aliases: PenalizedLDA.cv

### ** Examples

# Generate data #
set.seed(1)
n <- 20 # number of training obs
m <- 40 # number of test obs
p <- 100 # number of features
x <- matrix(rnorm(n*p), ncol=p)
xte <- matrix(rnorm(m*p), ncol=p)
y <- c(rep(1,5),rep(2,5),rep(3,6), rep(4,4))
yte <- rep(1:4, each=10) 
x[y==1,1:10] <- x[y==1,1:10] + 2
x[y==2,11:20] <- x[y==2,11:20] - 2
x[y==3,21:30] <- x[y==3,21:30] - 2.5
xte[yte==1,1:10] <- xte[yte==1,1:10] + 2
xte[yte==2,11:20] <- xte[yte==2,11:20] - 2
xte[yte==3,21:30] <- xte[yte==3,21:30] - 2.5


# Perform cross-validation #
# Use type="ordered" -- that is, we are assuming that the features have
# some sort of spatial structure
cv.out <-
PenalizedLDA.cv(x,y,type="ordered",lambdas=c(1e-4,1e-3,1e-2,.1,1,10),lambda2=.3)
print(cv.out)
plot(cv.out)
# Perform penalized LDA #
out <- PenalizedLDA(x,y,xte=xte,type="ordered", lambda=cv.out$bestlambda,
K=cv.out$bestK, lambda2=.3)
print(out)
plot(out)
print(table(out$ypred[,out$K],yte))




# Now repeat penalized LDA computations but this time use
# type="standard"  - i.e. don't exploit spatial structure
# Perform cross-validation #
cv.out <-
PenalizedLDA.cv(x,y,lambdas=c(1e-4,1e-3,1e-2,.1,1,10))
print(cv.out)
plot(cv.out)
# Perform penalized LDA #
out <- PenalizedLDA(x,y,xte=xte,lambda=cv.out$bestlambda,K=cv.out$bestK)
print(out)
plot(out)
print(table(out$ypred[,out$K],yte))



