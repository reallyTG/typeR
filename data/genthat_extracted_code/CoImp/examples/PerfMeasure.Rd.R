library(CoImp)


### Name: PerfMeasure
### Title: Performance measures for evaluating the goodness of an imputed
###   database
### Aliases: PerfMeasure
### Keywords: imputation copula multivariate

### ** Examples


# generate data from a 4-variate Gumbel copula with different margins

set.seed(11)
n.marg <- 4
theta  <- 5
copula <- frankCopula(theta, dim = n.marg)
mymvdc <- mvdc(copula, c("norm", "gamma", "beta","gamma"), list(list(mean=7, sd=2),
 list(shape=3, rate=2), list(shape1=4, shape2=1), list(shape=4, rate=3)))
n      <- 20
x.samp <- rMvdc(n, mymvdc)

# randomly introduce univariate and multivariate missing

perc.mis    <- 0.5
set.seed(11)
miss.row    <- sample(1:n, perc.mis*n, replace=TRUE)
miss.col    <- sample(1:n.marg, perc.mis*n, replace=TRUE)
miss        <- cbind(miss.row,miss.col)
x.samp.miss <- replace(x.samp,miss,NA)

# impute missing values

imp <- CoImp(x.samp.miss, n.marg=n.marg, smoothing=rep(0.6,n.marg), plot=TRUE,
            type.data="continuous");
imp

# apply PerfMeasure to the imputed data set

pm <- PerfMeasure(db.complete=x.samp, db.missing=x.samp.miss,
                  db.imputed=imp@"Imputed.data.matrix", n.marg=4)

pm

str(pm)




