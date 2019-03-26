library(VGAM)


### Name: simulate.vlm
### Title: Simulate Responses for VGLMs and VGAMs
### Aliases: simulate.vlm
### Keywords: models datagen

### ** Examples

nn <- 10; mysize <- 20; set.seed(123)
bdata <- data.frame(x2 = rnorm(nn))
bdata <- transform(bdata,
  y1   = rbinom(nn, size = mysize, p = logit(1+x2, inverse = TRUE)),
  y2   = rbinom(nn, size = mysize, p = logit(1+x2, inverse = TRUE)),
  f1   = factor(as.numeric(rbinom(nn, size = 1,
                                  p = logit(1+x2, inverse = TRUE)))))
(fit1 <- vglm(cbind(y1, aaa = mysize - y1) ~ x2,  # Matrix response (2-colns)
              binomialff, data = bdata))
(fit2 <- vglm(f1 ~ x2, binomialff, model = TRUE, data = bdata)) # Factor response

set.seed(123); simulate(fit1, nsim = 8)
set.seed(123); c(simulate(fit2, nsim = 3))  # Use c() when model = TRUE

# An n x N x F example
set.seed(123); n <- 100
bdata <- data.frame(x2 = runif(n), x3 = runif(n))
bdata <- transform(bdata, y1 = rnorm(n, 1 + 2 * x2),
                          y2 = rnorm(n, 3 + 4 * x2))
fit1 <- vglm(cbind(y1, y2) ~ x2, binormal(eq.sd = TRUE), data = bdata)
nsim <- 1000  # Number of simulations for each observation
my.sims <- simulate(fit1, nsim = nsim)
dim(my.sims)  # A data frame
aaa <- array(unlist(my.sims), c(n, nsim, ncol(fitted(fit1))))  # n by N by F
summary(rowMeans(aaa[, , 1]) - fitted(fit1)[, 1])  # Should be all 0s
summary(rowMeans(aaa[, , 2]) - fitted(fit1)[, 2])  # Should be all 0s

# An n x F x N example
n <- 100; set.seed(111); nsim <- 1000
zdata <- data.frame(x2 = runif(n))
zdata <- transform(zdata, lambda1 =  loge(-0.5 + 2 * x2, inverse = TRUE),
                          lambda2 =  loge( 0.5 + 2 * x2, inverse = TRUE),
                          pstr01  = logit( 0,            inverse = TRUE),
                          pstr02  = logit(-1.0,          inverse = TRUE))
zdata <- transform(zdata, y1 = rzipois(n, lambda = lambda1, pstr0 = pstr01),
                          y2 = rzipois(n, lambda = lambda2, pstr0 = pstr02))
zip.fit  <- vglm(cbind(y1, y2) ~ x2, zipoissonff, data = zdata, crit = "coef")
my.sims <- simulate(zip.fit, nsim = nsim)
dim(my.sims)  # A data frame
aaa <- array(unlist(my.sims), c(n, ncol(fitted(zip.fit)), nsim))  # n by F by N
summary(rowMeans(aaa[, 1, ]) - fitted(zip.fit)[, 1])  # Should be all 0s
summary(rowMeans(aaa[, 2, ]) - fitted(zip.fit)[, 2])  # Should be all 0s



