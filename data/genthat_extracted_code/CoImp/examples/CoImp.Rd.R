library(CoImp)


### Name: CoImp
### Title: Copula-Based Imputation Method
### Aliases: CoImp
### Keywords: imputation copula multivariate

### ** Examples


## generate data from a 4-variate Frank copula with different margins

set.seed(11)
n.marg <- 4
theta  <- 5
copula <- frankCopula(theta, dim = n.marg)
mymvdc <- mvdc(copula, c("norm", "gamma", "beta","gamma"), list(list(mean=7, sd=2),
list(shape=3, rate=2), list(shape1=4, shape2=1), list(shape=4, rate=3)))
n      <- 20
x.samp <- copula::rMvdc(n, mymvdc)

# randomly introduce univariate and multivariate missing

perc.mis    <- 0.5
set.seed(11)
miss.row    <- sample(1:n, perc.mis*n, replace=TRUE)
miss.col    <- sample(1:n.marg, perc.mis*n, replace=TRUE)
miss        <- cbind(miss.row,miss.col)
x.samp.miss <- replace(x.samp,miss,NA)

# impute missing values

imp <- CoImp(x.samp.miss, n.marg=n.marg, smoothing = rep(0.6,n.marg), plot=TRUE,
       type.data="continuous");

# methods show and plot

show(imp)
plot(imp)

## generate data from a 3-variate Clayton copula with different bounded margins

set.seed(11)
n.marg <- 3
theta  <- 5
copula <- claytonCopula(theta, dim = n.marg)
mymvdc <- mvdc(copula, c("beta", "beta", "beta"), list(list(shape1=4, shape2=1),
            list(shape1=.5, shape2=.5), list(shape1=2, shape2=3)))
n      <- 100
x.samp <- copula::rMvdc(n, mymvdc)

# randomly introduce univariate and multivariate missing

perc.mis    <- 0.2
set.seed(11)
miss.row    <- sample(1:n, perc.mis*n, replace=TRUE)
miss.col    <- sample(1:n.marg, perc.mis*n, replace=TRUE)
miss        <- cbind(miss.row,miss.col)
x.samp.miss <- replace(x.samp,miss,NA)

# impute missing values

imp <- CoImp(x.samp.miss, n.marg=n.marg, smoothing = c(0.45,0.2,0.5), plot=TRUE,
        q.lo=rep(0.1,n.marg), q.up=rep(0.9,n.marg));

# methods show and plot

show(imp)
plot(imp)




