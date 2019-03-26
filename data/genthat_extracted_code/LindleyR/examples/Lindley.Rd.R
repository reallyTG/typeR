library(LindleyR)


### Name: Lindley
### Title: One-Parameter Lindley Distribution
### Aliases: Lindley dlindley hlindley plindley qlindley rlindley
###   waitingtimes

### ** Examples

set.seed(1)
x <- rlindley(n = 1000, theta = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dlindley(S, theta = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
plindley(q, theta = 1.5, lower.tail = TRUE)
plindley(q, theta = 1.5, lower.tail = FALSE)
qlindley(p, theta = 1.5, lower.tail = TRUE)
qlindley(p, theta = 1.5, lower.tail = FALSE)

## waiting times data (from Ghitany et al., 2008)
data(waitingtimes)
library(fitdistrplus)
fit <- fitdist(waitingtimes, 'lindley', start = list(theta = 0.1))
plot(fit)





