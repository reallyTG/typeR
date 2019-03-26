library(invgamma)


### Name: invexp
### Title: The Inverse Exponential Distribution
### Aliases: invexp dinvexp pinvexp qinvexp rinvexp

### ** Examples


s <- seq(0, 10, .01)
plot(s, dinvexp(s, 2), type = 'l')

f <- function(x) dinvexp(x, 2)
q <- 3
integrate(f, 0, q)
(p <- pinvexp(q, 2))
qinvexp(p, 2) # = q
mean(rinvexp(1e5, 2) <= q)

pinvgamma(q, 1, 2)






