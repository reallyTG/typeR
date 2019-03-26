library(LindleyR)


### Name: NWLindley
### Title: New Weighted Lindley Distribution
### Aliases: NWLindley dnwlindley hnwlindley pnwlindley qnwlindley
###   rnwlindley

### ** Examples

set.seed(1)
x <- rnwlindley(n = 1000, theta = 1.5, alpha = 1.5)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dnwlindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pnwlindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pnwlindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qnwlindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qnwlindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'nwlindley', start = list(theta = 1.5, alpha = 1.5))
plot(fit)




