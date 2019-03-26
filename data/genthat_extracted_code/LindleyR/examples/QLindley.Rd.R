library(LindleyR)


### Name: QLindley
### Title: Quasi Lindley Distribution
### Aliases: QLindley dqlindley hqlindley pqlindley qqlindley rqlindley

### ** Examples

set.seed(1)
x <- rqlindley(n = 1000, theta = 1.5, alpha = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dqlindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pqlindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pqlindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qqlindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qqlindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'qlindley', start = list(theta = 1.5, alpha = 1.5))
plot(fit)




