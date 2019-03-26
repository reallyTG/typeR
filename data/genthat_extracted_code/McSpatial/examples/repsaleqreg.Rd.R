library(McSpatial)


### Name: repsaleqreg
### Title: Quantile Repeat Sales Estimation
### Aliases: repsaleqreg
### Keywords: Repeat Sales Quantile Regression

### ** Examples

set.seed(189)
n = 2000
# sale dates range from 0-10
# drawn uniformly from all possible time0, time1 combinations with time0<time1
tmat <- expand.grid(seq(0,10), seq(0,10))
tmat <- tmat[tmat[,1]<tmat[,2], ]
tobs <- sample(seq(1:nrow(tmat)),n,replace=TRUE)
time0 <- tmat[tobs,1]
time1 <- tmat[tobs,2]
timesale <- time1-time0
table(timesale)

# constant variance; index ranges from 0 at time 0 to 1 at time 10
y0 <- time0/10 + rnorm(n,0,.2)
y1 <- time1/10 + rnorm(n,0,.2)
fit <- repsaleqreg(price0=y0, price1=y1, time0=time0, time1=time1)

# variance rises with timesale
# var(u0) = .2^2; var(u1) = (.2 + timesale/10)^2
# var(u1-u0) = var(u0) + var(u1) = 2*(.2^2) + .4*timesale/10 + (timesale^2)/100
y0 <- time0/10 + rnorm(n,0,.2)
y1 <- time1/10 + rnorm(n,0,.2+timesale/10)
par(ask=TRUE)
fit <- repsaleqreg(price0=y0, price1=y1, time0=time0, time1=time1)
summary(fit$pindex)




