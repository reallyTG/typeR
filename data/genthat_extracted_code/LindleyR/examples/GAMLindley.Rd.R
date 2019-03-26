library(LindleyR)


### Name: GAMLindley
### Title: Gamma Lindley Distribution
### Aliases: GAMLindley dgamlindley hgamlindley pgamlindley qgamlindley
###   rgamlindley

### ** Examples

set.seed(1)
x <- rgamlindley(n = 1000, theta = 1.5, alpha = 1.5, mixture = TRUE)
R <- range(x)
S <- seq(from = R[1], to = R[2], by = 0.1)
plot(S, dgamlindley(S, theta = 1.5, alpha = 1.5), xlab = 'x', ylab = 'pdf')
hist(x, prob = TRUE, main = '', add = TRUE)

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pgamlindley(q, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
pgamlindley(q, theta = 1.5, alpha = 1.5, lower.tail = FALSE)
qgamlindley(p, theta = 1.5, alpha = 1.5, lower.tail = TRUE)
qgamlindley(p, theta = 1.5, alpha = 1.5, lower.tail = FALSE)

library(fitdistrplus)
fit <- fitdist(x, 'gamlindley', start = list(theta = 1.5, alpha = 1.5))
plot(fit)




