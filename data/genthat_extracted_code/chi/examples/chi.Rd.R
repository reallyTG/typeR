library(chi)


### Name: chi
### Title: The Chi Distribution
### Aliases: chi dchi pchi qchi rchi

### ** Examples


s <- seq(0, 5, .01)
plot(s, dchi(s, 7), type = 'l')

f <- function(x) dchi(x, 7)
q <- 2
integrate(f, 0, q)
(p <- pchi(q, 7))
qchi(p, 7) # = q
mean(rchi(1e5, 7) <= q)


samples <- rchi(1e5, 7)
plot(density(samples))
curve(f, add = TRUE, col = "red")





