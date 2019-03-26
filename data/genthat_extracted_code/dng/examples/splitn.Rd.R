library(dng)


### Name: splitn
### Title: Split-normal distribution
### Aliases: splitn dsplitn psplitn qsplitn rsplitn
### Keywords: asymmetric distribution normal

### ** Examples


n <- 3
mu <- c(0,1,2)
sigma <- c(1,2,3)
lmd <- c(1,2,3)

q0 <- rsplitn(n, mu, sigma, lmd)
d0 <- dsplitn(q0, mu, sigma, lmd, logarithm = FALSE)
p0 <- psplitn(q0, mu, sigma, lmd)
q1 <- qsplitn(p0,mu, sigma, lmd)
all.equal(q0, q1)



