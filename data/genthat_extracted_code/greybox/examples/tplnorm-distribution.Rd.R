library(greybox)


### Name: dtplnorm
### Title: Three Parameter Log Normal Distribution
### Aliases: dtplnorm ptplnorm qtplnorm rtplnorm
### Keywords: distribution

### ** Examples

x <- dtplnorm(c(-1000:1000)/200, 0, 1, 1)
plot(c(-1000:1000)/200, x, type="l")

x <- ptplnorm(c(-1000:1000)/200, 0, 1, 1)
plot(c(-1000:1000)/200, x, type="l")

qtplnorm(c(0.025,0.975), 0, c(1,2), 1)

x <- rtplnorm(1000, 0, 1, 1)
hist(x)




