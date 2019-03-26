library(LindleyR)


### Name: EXPLindley
### Title: Exponentiated Lindley Distribution
### Aliases: EXPLindley dexplindley hexplindley pexplindley qexplindley
###   relieftimes rexplindley

### ** Examples

set.seed(1)
x <- rexplindley(n = 1000, theta = 1.5, alpha = 1.5)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dexplindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pexplindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pexplindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qexplindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qexplindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

## Relief times data (from Nadarajah et al., 2011)
data(relieftimes)
library(fitdistrplus)
fit <- fitdist(relieftimes, 'explindley', start = list(theta = 1.5, alpha = 1.5))
plot(fit)




