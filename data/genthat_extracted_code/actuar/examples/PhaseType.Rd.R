library(actuar)


### Name: PhaseType
### Title: The Phase-type Distribution
### Aliases: dphtype pphtype rphtype mphtype mgfphtype
### Keywords: distribution

### ** Examples

## Erlang(3, 2) distribution
T <- cbind(c(-2, 0, 0), c(2, -2, 0), c(0, 2, -2))
pi <- c(1,0,0)
x <- 0:10

dphtype(x, pi, T)		# density
dgamma(x, 3, 2)			# same
pphtype(x, pi, T)		# cdf
pgamma(x, 3, 2)			# same

rphtype(10, pi, T)		# random values

mphtype(1, pi, T)		# expected value

curve(mgfphtype(x, pi, T), from = -10, to = 1)



