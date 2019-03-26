library(DstarM)


### Name: estCdf
### Title: Estimate cumulative distribution for D*M models
### Aliases: estCdf

### ** Examples

x = rnorm(1000)
xx = seq(-5, 5, .1)
approx1 = stats::ecdf(x)(xx)
approx2 = estCdf(dnorm(xx, mean(x), sd(x)))
trueCdf = pnorm(xx)
matplot(xx, cbind(trueCdf, approx1, approx2), type = c('l', 'p', 'p'),
        lty = 1, col = 1:3, pch = 1, bty = 'n', las = 1, ylab = 'Prob')
legend('topleft', legend = c('True Cdf', 'Stats Estatimation', 'DstarM Estimation'),
       col = 1:3, lty = c(1, NA, NA), pch = c(NA, 1, 1), bty = 'n')




