library(contextual)


### Name: invgamma
### Title: The Inverse Gamma Distribution
### Aliases: invgamma dinvgamma pinvgamma qinvgamma rinvgamma

### ** Examples


s <- seq(0, 5, .01)
plot(s, dinvgamma(s, 7, 10), type = 'l')

f <- function(x) dinvgamma(x, 7, 10)
q <- 2
integrate(f, 0, q)
(p <- pinvgamma(q, 7, 10))
qinvgamma(p, 7, 10) # = q
mean(rinvgamma(1e5, 7, 10) <= q)



