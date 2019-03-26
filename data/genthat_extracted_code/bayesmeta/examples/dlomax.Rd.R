library(bayesmeta)


### Name: dlomax
### Title: The Lomax distribution.
### Aliases: dlomax plomax qlomax rlomax
### Keywords: distribution

### ** Examples

#######################
# illustrate densities:
x <- seq(0,6,le=200)
plot(x, dexp(x, rate=1), type="l", col="cyan", ylim=c(0,1),
     xlab=expression(tau), ylab=expression("probability density "*f(tau)))
lines(x, dlomax(x), col="orange")
abline(h=0, v=0, col="grey")

# show log-densities (note the differing tail behaviour):
plot(x, dexp(x, rate=1), type="l", col="cyan", ylim=c(0.001,1), log="y",
     xlab=expression(tau), ylab=expression("probability density "*f(tau)))
lines(x, dlomax(x), col="orange")
abline(v=0, col="grey")

######################################################
# illustrate the gamma-exponential mixture connection;
# specify a number of samples:
N <- 10000
# specify some gamma shape and scale parameters
# (via mixing distribution's moments):
expectation <- 2.0
stdev       <- 1.0
gammashape <- (expectation / stdev)^2
gammascale <- stdev^2 / expectation
print(c("expectation"=expectation, "stdev"=stdev,
        "shape"=gammashape, "scale"=gammascale))
# generate gamma-distributed rates:
lambda <- rgamma(N, shape=gammashape, scale=gammascale)
# generate exponential draws according to gamma-rates:
y <- rexp(N, rate=lambda)
# determine Lomax quantiles accordingly parameterized:
x <- qlomax(ppoints(N), scale=1/gammascale, shape=gammashape)
# compare distributions in a Q-Q-plot:
plot(x, sort(y), log="xy", main="quantile-quantile plot",
     xlab="theoretical quantile", ylab="empirical quantile")
abline(0, 1, col="red")



