library(profdpm)


### Name: profLinear
### Title: Linear Product Partition Models
### Aliases: profLinear

### ** Examples

library(profdpm)
set.seed(42)

# set up some data
# linear model 0
x0  <- rnorm(50, 0, 3)
y0  <- x0 + rnorm(50, 0, 1) 

# linear model 1
x1  <- rnorm(50, 0, 3)
y1  <- 10 - x1 + rnorm(50, 0, 1)

# add a column of ones to the covariate matrix (intercept)
dat <- data.frame(x=c(x0, x1), y=c(y0,y1))

# indicate grouping within each linear model
grp <- c(rep(seq(0,4),10), rep(seq(5,9),10))

# fit the DPMLM
fit <- profLinear(y ~ x, data=dat, group=grp)

# plot the resulting fit(s)
plot(dat$x, dat$y, xlab='x', ylab='y')
for(i in 1:length(fit$m)) {
  abline( a=fit$m[[i]][1], b=fit$m[[i]][2] )
}



