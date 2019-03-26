library(LindleyR)


### Name: GENLindley
### Title: Generalized Lindley Distribution
### Aliases: GENLindley dgenlindley hgenlindley pgenlindley qgenlindley
###   rgenlindley

### ** Examples

set.seed(1)
x <- rgenlindley(n = 1000, theta = 1.5, alpha = 1.5, beta = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dgenlindley(S, theta = 1.5, alpha = 1.5, beta = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pgenlindley(q, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = TRUE)
pgenlindley(q, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = FALSE)
qgenlindley(p, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = TRUE)
qgenlindley(p, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'genlindley', start = list(theta = 1.5, alpha = 1.5, beta = 1.5))
plot(fit)




