library(LindleyR)


### Name: SLindley
### Title: Two-Parameter Lindley Distribution
### Aliases: SLindley dslindley hslindley pslindley qslindley rslindley

### ** Examples

set.seed(1)
x <- rslindley(n = 1000, theta = 1.5, alpha = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dslindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pslindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pslindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qslindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qslindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'slindley', start = list(theta = 1.5, alpha = 1.5))
plot(fit)




