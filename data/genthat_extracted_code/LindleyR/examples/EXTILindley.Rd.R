library(LindleyR)


### Name: EXTILindley
### Title: Extended Inverse Lindley Distribution
### Aliases: EXTILindley dextilindley hextilindley pextilindley
###   qextilindley rextilindley

### ** Examples

set.seed(1)
x <- rextilindley(n = 10000, theta = 5, alpha = 20, beta = 10)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.01)
plot(S, dextilindley(S, theta = 5, alpha = 20, beta = 20), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pextilindley(q, theta = 5, alpha = 20, beta = 10, lower.tail = TRUE)
pextilindley(q, theta = 5, alpha = 20, beta = 10, lower.tail = FALSE)
qextilindley(p, theta = 5, alpha = 20, beta = 10, lower.tail = TRUE)
qextilindley(p, theta = 5, alpha = 20, beta = 10, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'extilindley', start = list(theta = 5, alpha = 20, beta = 10))
plot(fit)



