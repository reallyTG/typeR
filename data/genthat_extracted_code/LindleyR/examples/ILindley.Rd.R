library(LindleyR)


### Name: ILindley
### Title: Inverse Lindley Distribution
### Aliases: ILindley dilindley hilindley pilindley qilindley rilindley

### ** Examples

x <- seq(from = 0.1, to = 3, by = 0.05)
plot(x, dilindley(x, theta = 1.0), xlab = 'x', ylab = 'pdf')

p <- seq(from = 0.1, to = 0.9, by = 0.1)
q <- quantile(x, prob = p)
pilindley(q, theta = 1.5, lower.tail = TRUE)
pilindley(q, theta = 1.5, lower.tail = FALSE)
qilindley(p, theta = 1.5, lower.tail = TRUE)
qilindley(p, theta = 1.5, lower.tail = FALSE)

set.seed(1)
x <- rilindley(n = 100, theta = 1.0)
library(fitdistrplus)
fit <- fitdist(x, 'ilindley', start = list(theta = 1.0))
plot(fit)




