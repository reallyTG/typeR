library(LindleyR)


### Name: GENILindley
### Title: Generalized Inverse Lindley Distribution
### Aliases: GENILindley dgenilindley hgenilindley pgenilindley
###   qgenilindley rgenilindley

### ** Examples

set.seed(1)
x <- rgenilindley(n = 1000, theta = 10, alpha = 20, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.01)
plot(S, dgenilindley(S, theta = 10, alpha = 20), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pgenilindley(q, theta = 10, alpha = 20, lower.tail = TRUE)
pgenilindley(q, theta = 10, alpha = 20, lower.tail = FALSE)
qgenilindley(p, theta = 10, alpha = 20, lower.tail = TRUE)
qgenilindley(p, theta = 10, alpha = 20, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'genilindley', start = list(theta = 10, alpha = 20))
plot(fit)





