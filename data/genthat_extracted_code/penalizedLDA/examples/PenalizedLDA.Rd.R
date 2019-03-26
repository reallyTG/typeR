library(penalizedLDA)


### Name: PenalizedLDA
### Title: Perform penalized linear discriminant analysis using L1 or fused
###   lasso penalties.
### Aliases: PenalizedLDA

### ** Examples

set.seed(1)
n <- 20
p <- 100
x <- matrix(rnorm(n*p), ncol=p)
y <- c(rep(1,5),rep(2,5),rep(3,10))
x[y==1,1:10] <- x[y==1,1:10] + 2
x[y==2,11:20] <- x[y==2,11:20] - 2
out <- PenalizedLDA(x,y,lambda=.14,K=2)
print(out)
plot(out)
# For more examples, try "?PenalizedLDA.cv"



