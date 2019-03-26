library(LindleyR)


### Name: WLindley
### Title: Weighted Lindley Distribution
### Aliases: WLindley carbonfibers dwlindley hwlindley pwlindley qwlindley
###   rwlindley

### ** Examples

set.seed(1)
x <- rwlindley(n = 1000, theta = 1.5, alpha = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dwlindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pwlindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pwlindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qwlindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qwlindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

## carbon fibers data (from Ghitany et al., 2013)
data(carbonfibers)
library(fitdistrplus)
fit <- fitdist(carbonfibers, 'wlindley', start = list(theta = 0.1, alpha = 0.1))
plot(fit)




