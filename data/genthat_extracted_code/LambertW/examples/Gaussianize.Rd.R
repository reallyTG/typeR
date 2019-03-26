library(LambertW)


### Name: Gaussianize
### Title: Gaussianize matrix-like objects
### Aliases: Gaussianize
### Keywords: multivariate univar

### ** Examples


# Univariate example
set.seed(20)
y1 <- rcauchy(n = 100)
out <- Gaussianize(y1, return.tau.mat = TRUE)
x1 <- get_input(y1, c(out$tau.mat[, 1]))  # same as out$input
test_normality(out$input) # Gaussianized a Cauchy!

kStartFrom <- 20
y.cum.avg <- (cumsum(y1)/seq_along(y1))[-seq_len(kStartFrom)]
x.cum.avg <- (cumsum(x1)/seq_along(x1))[-seq_len(kStartFrom)]

plot(c((kStartFrom + 1): length(y1)), y.cum.avg, type="l" , lwd = 2, 
     main="CLT in practice", xlab = "n", 
     ylab="Cumulative sample average", 
     ylim = range(y.cum.avg, x.cum.avg))
lines(c((kStartFrom+1): length(y1)), x.cum.avg, col=2, lwd=2)
abline(h = 0)
grid()
legend("bottomright", c("Cauchy", "Gaussianize"), col = c(1, 2), 
       box.lty = 0, lwd = 2, lty = 1)

plot(x1, y1, xlab="Gaussian-like input", ylab = "Cauchy - output")
grid()

# multivariate example
y2 <- 0.5 * y1 + rnorm(length(y1))
YY <- cbind(y1, y2)
plot(YY)

XX <- Gaussianize(YY, type = "hh")
plot(XX)

out <- Gaussianize(YY, type = "h", return.tau.mat = TRUE, 
                   verbose = TRUE, method = "IGMM")
                   
plot(out$input)
out$tau.mat

YY.hat <- Gaussianize(data = out$input, tau.mat = out$tau.mat,
                      inverse = TRUE)
plot(YY.hat[, 1], YY[, 1])




