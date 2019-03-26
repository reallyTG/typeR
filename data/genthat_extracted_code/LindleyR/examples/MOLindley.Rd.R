library(LindleyR)


### Name: MOLindley
### Title: Marshall-Olkin Extended Lindley Distribution
### Aliases: MOLindley bladdercancer dmolindley hmolindley pmolindley
###   qmolindley rmolindley

### ** Examples

set.seed(1)
x <- rmolindley(n = 1000, theta = 5, alpha = 5)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dmolindley(S, theta = 5, alpha = 5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pmolindley(q, theta = 5, alpha = 5, lower.tail = TRUE)
pmolindley(q, theta = 5, alpha = 5, lower.tail = FALSE)
qmolindley(p, theta = 5, alpha = 5, lower.tail = TRUE)
qmolindley(p, theta = 5, alpha = 5, lower.tail = FALSE)

## bladder cancer data (from Warahena-Liyanage and Pararai, 2014)
data(bladdercancer)
library(fitdistrplus)
fit <- fitdist(bladdercancer, 'molindley', start = list(theta = 0.1, alpha =  1.0))
plot(fit)




