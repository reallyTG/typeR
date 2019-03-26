library(chi)


### Name: invchi
### Title: The Inverse Chi Distribution
### Aliases: invchi dinvchi pinvchi qinvchi rinvchi

### ** Examples


s <- seq(0, 2, .01)
plot(s, dinvchi(s, 7), type = 'l')

f <- function(x) dinvchi(x, 7)
q <- .5
integrate(f, 0, q)
(p <- pinvchi(q, 7))
qinvchi(p, 7) # = q
mean(rinvchi(1e5, 7) <= q)


samples <- rinvchi(1e5, 7)
plot(density(samples))
curve(f, add = TRUE, col = "red")





