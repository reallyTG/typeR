library(LindleyR)


### Name: EXTLindley
### Title: Extended Lindley Distribution
### Aliases: EXTLindley dextlindley hextlindley pextlindley qextlindley
###   rextlindley

### ** Examples

set.seed(1)
x <- rextlindley(n = 1000, theta = 5.0, alpha = -1.0, beta = 5.0)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.01)
plot(S, dextlindley(S, theta = 5.0, alpha = -1.0, beta = 5.0), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pextlindley(q, theta = 5.0, alpha = -1.0, beta = 5.0, lower.tail = TRUE)
pextlindley(q, theta = 5.0, alpha = -1.0, beta = 5.0, lower.tail = FALSE)
qextlindley(p, theta = 5.0, alpha = -1.0, beta = 5.0, lower.tail = TRUE)
qextlindley(p, theta = 5.0, alpha = -1.0, beta = 5.0, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'extlindley', start = list(theta = 5.0, alpha = -1.0, beta = 5.0))
plot(fit)




