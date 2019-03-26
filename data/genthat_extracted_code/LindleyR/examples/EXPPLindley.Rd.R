library(LindleyR)


### Name: EXPPLindley
### Title: Exponentiated Power Lindley Distribution
### Aliases: EXPPLindley dexpplindley hexpplindley pexpplindley
###   qexpplindley rexpplindley

### ** Examples

set.seed(1)
x <- rexpplindley(n = 1000, theta = 11.0, alpha = 5.0, beta = 2.0)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.01)
plot(S, dexpplindley(S, theta = 11.0, alpha = 5.0, beta = 2.0), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pexpplindley(q, theta = 11.0, alpha = 5.0, beta = 2.0, lower.tail = TRUE)
pexpplindley(q, theta = 11.0, alpha = 5.0, beta = 2.0, lower.tail = FALSE)
qexpplindley(p, theta = 11.0, alpha = 5.0, beta = 2.0, lower.tail = TRUE)
qexpplindley(p, theta = 11.0, alpha = 5.0, beta = 2.0, lower.tail = FALSE)

## bladder cancer data (from Warahena-Liyanage and Pararai, 2014)
data(bladdercancer)
library(fitdistrplus)
fit <- fitdist(bladdercancer, 'expplindley', start = list(theta = 1, alpha =  1, beta = 1))
plot(fit)





