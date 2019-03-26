library(LindleyR)


### Name: EXTPLindley
### Title: Extended Power Lindley Distribution
### Aliases: EXTPLindley dextplindley hextplindley pextplindley
###   qextplindley rextplindley

### ** Examples

set.seed(1)
x <- rextplindley(n = 1000, theta = 1.5, alpha = 1.5, beta = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dextplindley(S, theta = 1.5, alpha = 1.5, beta = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pextplindley(q, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = TRUE)
pextplindley(q, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = FALSE)
qextplindley(p, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = TRUE)
qextplindley(p, theta = 1.5, alpha = 1.5, beta = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'extplindley', start = list(theta = 1.5, alpha = 1.5, beta = 1.5))
plot(fit)




