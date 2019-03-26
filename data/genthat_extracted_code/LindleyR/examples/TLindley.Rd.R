library(LindleyR)


### Name: TLindley
### Title: Transmuted Lindley Distribution
### Aliases: TLindley dtlindley htlindley ptlindley qtlindley rtlindley

### ** Examples

set.seed(1)
x <- rtlindley(n = 1000, theta = 1.5, alpha = 0.5)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dtlindley(S, theta = 1.5, alpha = 0.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
ptlindley(q, theta = 1.5, alpha = 0.5, lower.tail = TRUE)
ptlindley(q, theta = 1.5, alpha = 0.5, lower.tail = FALSE)
qtlindley(p, theta = 1.5, alpha = 0.5, lower.tail = TRUE)
qtlindley(p, theta = 1.5, alpha = 0.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'tlindley', start = list(theta = 1.5, alpha = 0.5))
plot(fit)





