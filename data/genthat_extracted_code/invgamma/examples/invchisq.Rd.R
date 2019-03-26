library(invgamma)


### Name: invchisq
### Title: The Inverse (non-central) Chi-Squared Distribution
### Aliases: invchisq dinvchisq pinvchisq qinvchisq rinvchisq

### ** Examples


s <- seq(0, 3, .01)
plot(s, dinvchisq(s, 3), type = 'l')

f <- function(x) dinvchisq(x, 3)
q <- 2
integrate(f, 0, q)
(p <- pinvchisq(q, 3))
qinvchisq(p, 3) # = q
mean(rinvchisq(1e5, 3) <= q)




f <- function(x) dinvchisq(x, 3, ncp = 2)
q <- 1.5
integrate(f, 0, q)
(p <- pinvchisq(q, 3, ncp = 2))
qinvchisq(p, 3, ncp = 2) # = q
mean(rinvchisq(1e7, 3, ncp = 2) <= q)






