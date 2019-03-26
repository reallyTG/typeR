library(KScorrect)


### Name: dmixnorm
### Title: The Normal Mixture Distribution
### Aliases: dmixnorm pmixnorm qmixnorm rmixnorm

### ** Examples

# Mixture of two normal distributions
mean <- c(3, 6)
pro <- c(.25, .75)
sd <- c(.5, 1)
x <- rmixnorm(n=5000, mean=mean, pro=pro, sd=sd)
hist(x, n=20, main="random bimodal sample")

## Not run: 
##D # Requires functions from the 'mclust' package
##D require(mclust)
##D # Confirm 'rmixnorm' above produced specified model
##D mod <- mclust::Mclust(x)
##D mod             # Best model (correctly) has two-components with unequal variances
##D mod$parameters	# and approximately same parameters as specified above
##D sd^2            # Note reports var (sigma-squared) instead of sd used above
## End(Not run)

# Density, distribution, and quantile functions
plot(seq(0, 10, .1), dmixnorm(seq(0, 10, .1), mean=mean, sd=sd, pro=pro),
     type="l", main="Normal mixture density")
plot(seq(0, 10, .1), pmixnorm(seq(0, 10, .1), mean=mean, sd=sd, pro=pro),
     type="l", main="Normal mixture cumulative")
plot(stats::ppoints(100), qmixnorm(stats::ppoints(100), mean=mean, sd=sd, pro=pro),
     type="l", main="Normal mixture quantile")

# Any number of mixture components are allowed
plot(seq(0, 50, .01), pmixnorm(seq(0, 50, .01), mean=1:50, sd=.05, pro=rep(1, 50)),
     type="l", main="50-component normal mixture cumulative")

# 'expand' can be specified to prevent non-calculable quantiles:
q1 <- qmixnorm(stats::ppoints(30), mean=c(1, 20), sd=c(1, 1), pro=c(1, 1))
q1 # Calls a warning because of NaNs
# Reduce 'expand'. (Values < 0.8 allow correct approximation)
q2 <- qmixnorm(stats::ppoints(30), mean=c(1, 20), sd=c(1, 1), pro=c(1, 1), expand=.5)
plot(stats::ppoints(30), q2, type="l", main="Quantile with reduced range")

## Not run: 
##D # Requires functions from the 'mclust' package
##D # Confirmation that qmixnorm approximates correct solution
##D #   (single component 'mixture' should mimic qnorm):
##D x <- rmixnorm(n=5000, mean=0, pro=1, sd=1)
##D mpar <- mclust::Mclust(x)$param
##D approx <- qmixnorm(p=ppoints(100), mean=mpar$mean, pro=mpar$pro,
##D      sd=sqrt(mpar$variance$sigmasq))
##D known <- qnorm(p=ppoints(100), mean=mpar$mean, sd=sqrt(mpar$variance$sigmasq))
##D cor(approx, known)  # Approximately the same
##D plot(approx, main="Quantiles for (unimodal) normal")
##D lines(known)
##D legend("topleft", legend=c("known", "approximation"), pch=c(NA,1),
##D      lty=c(1, NA), bty="n")
## End(Not run)



