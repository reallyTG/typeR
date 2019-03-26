library(LindleyR)


### Name: LindleyE
### Title: Lindley Exponential Distribution
### Aliases: LindleyE dlindleye hlindleye plindleye qlindleye rlindleye

### ** Examples

set.seed(1)
x <- rlindleye(n = 1000, theta = 5.0, alpha = 0.2)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dlindleye(S, theta = 5.0, alpha = 0.2), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
plindleye(q, theta = 5.0, alpha = 0.2, lower.tail = TRUE)
plindleye(q, theta = 5.0, alpha = 0.2, lower.tail = FALSE)
qlindleye(p, theta = 5.0, alpha = 0.2, lower.tail = TRUE)
qlindleye(p, theta = 5.0, alpha = 0.2, lower.tail = FALSE)

## waiting times data (from Ghitany et al., 2008)
data(waitingtimes)
library(fitdistrplus)
fit <- fitdist(waitingtimes, 'lindleye', start = list(theta = 2.6, alpha = 0.15),
 lower = c(0.01, 0.01))
plot(fit)




