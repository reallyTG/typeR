library(rPowerSampleSize)


### Name: indiv.1m.ssc
### Title: Sample size computation with an individual testing procedure in
###   the context of multiple continuous endpoints
### Aliases: indiv.1m.ssc asympt.ssc known.ssc unknown.ssc
### Keywords: package multiple testing individual procedure sample size
###   computation

### ** Examples

# Sample size computation for the individual method
indiv.1m.ssc(method = "Known", ES = c(0.1, 0.2, 0.3), cor = diag(1, 3))

# Table 2 in our 2014 paper:
Sigma2 <- matrix(c(5.58, 2, 1.24, 2, 4.29, 1.59, 1.24, 1.59, 4.09), ncol = 3)
sd2 <- sqrt(diag(Sigma2))
cor2 <- diag(1 / sd2) %*% Sigma2 %*% diag(1 / sd2)
mu2 <- c(0.35, 0.28, 0.46)
m <- 3
indiv.1m.ssc(method = "Known", ES = mu2 / sd2, cor = cor2)



