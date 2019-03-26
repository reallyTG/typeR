library(repeated)


### Name: hidden
### Title: Discrete-time Hidden Markov Chain Models
### Aliases: hidden plot.hidden
### Keywords: models

### ** Examples


# generate two random Poisson sequences with change-points
y <- rbind(c(rpois(5,1), rpois(15,5)), c(rpois(15,1), rpois(5,5)))
print(z <- hidden(y,dist="Poisson", cmu=~1, pcmu=c(1,5),
	pgamma=matrix(c(0.9,0.2,0.1,0.8),ncol=2)))
# or equivalently
mu <- function(p) array(rep(p[1:2],rep(2,2)), c(2,2))
print(z <- hidden(y,dist="Poisson", cmu=mu, pcmu=c(1,5),
	pgamma=matrix(c(0.9,0.2,0.1,0.8),ncol=2)))
# or
# param nind For plotting: numbers of individuals to plot.
# param state For plotting: states to plot.
print(z <- hidden(y,dist="Poisson", mu=~rep(a,40), pmu=c(1,5),
	pgamma=matrix(c(0.9,0.2,0.1,0.8),ncol=2)))
par(mfrow=c(3,2))
plot(z, nind=1:2)
plot(z, nind=1:2, smooth=TRUE)
plot(iprofile(z), lty=2)
plot(mprofile(z), add=TRUE)
plot(iprofile(z), nind=2, lty=2)
plot(mprofile(z), nind=2, add=TRUE)





