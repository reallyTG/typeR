library(HSDiC)


### Name: HSDiC_ADMM
### Title: Homogeneity Detection Incorporating Prior Constraint Information
###   by ADMM
### Aliases: HSDiC_ADMM

### ** Examples


## data generation
set.seed(111)
n=100
p=50
r <- 1 #0.5, 0.8, 1

beta <- r*c(sample(rep(1:2, each = 10)), rep(0,10), -sample(rep(1:2, each = 10)) )
X <- matrix(rnorm(n*p),nrow = n)
sigma = 1
Y <- X %*% beta + sigma * rnorm(n, 0, 1)


# equalities
A.eq <- rbind(rep(1,p))
b.eq <- c(0)

# inequalities
A.ge <- diag( c(rep(1,30), rep(-1,20)) )
b.ge <- rep(0,p)

# lower-bounds
A.lbs <- diag(1, p)
b.lbs <- rep(-2, p)

# upper-bounds on variables
A.ubs <- diag(-1, p)
b.ubs <- rep(-2, p)

ptm <- proc.time()
fit <- HSDiC_ADMM(X, Y, A.eq, A.ge, A.lbs, A.ubs, b.eq, b.ge, b.lbs, b.ubs,
                 penalty = "adlasso", lambda2 = 0.8, admmScale2 = 1)
proc.time() - ptm

## table(round(fit$beta,1))

plot(beta, type="p", pch = 20, cex = 1)
points(fit$beta, col = 3)





