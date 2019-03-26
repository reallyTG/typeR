library(repeated)


### Name: chidden
### Title: Continuous-time Hidden Markov Chain Models
### Aliases: chidden
### Keywords: models

### ** Examples


# model for one randomly-generated binary series
y <- c(rbinom(10,1,0.1), rbinom(10,1,0.9))
mu <- function(p) array(p, c(1,2))
print(z <- chidden(y, times=1:20, dist="Bernoulli",
	pgamma=matrix(c(-0.1,0.2,0.1,-0.2),ncol=2),
	cmu=mu, pcmu=c(-2,2)))
# or equivalently
print(z <- chidden(y, times=1:20, dist="Bernoulli",
	pgamma=matrix(c(-0.1,0.2,0.1,-0.2),ncol=2),
	cmu=~1, pcmu=c(-2,2)))
# or
print(z <- chidden(y, times=1:20, dist="Bernoulli",
	pgamma=matrix(c(-0.1,0.2,0.1,-0.2),ncol=2),
	mu=~rep(a,20), pmu=c(-2,2)))
mexp(z$gamma)
par(mfcol=c(2,2))
plot(z)
plot(iprofile(z), lty=2)
plot(mprofile(z), add=TRUE)
print(z <- chidden(y, times=(1:20)*2, dist="Bernoulli",
	pgamma=matrix(c(-0.05,0.1,0.05,-0.1),ncol=2),
	cmu=~1, pcmu=c(-2,2)))
mexp(z$gamma) %*% mexp(z$gamma)
plot(z)
plot(iprofile(z), lty=2)
plot(mprofile(z), add=TRUE)




