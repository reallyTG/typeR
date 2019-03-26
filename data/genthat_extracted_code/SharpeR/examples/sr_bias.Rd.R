library(SharpeR)


### Name: sr_bias
### Title: sr_bias .
### Aliases: sr_bias

### ** Examples


# bias under normality:
sr_bias(1, 100, rep(0,2), type='simple')
sr_bias(1, 100, rep(0,5), type='second_order')

# plugging in sample estimates
x <- rnorm(1000)
n <- length(x)
mu <- mean(x)
sdv <- sd(x)
snr <- mu / sdv
# these are not great estimates, but close enough:
sku <- mean((x-mu)^3) / sdv^3
kur <- (mean((x-mu)^4) / sdv^4) - 4
sr_bias(snr, n, c(sku,kur), type='simple')




