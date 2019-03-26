library(sievePH)


### Name: sievePHaipw
### Title: Semiparametric Augmented Inverse Probability Weighted
###   Complete-Case Estimation of Coefficients in a Mark-Specific
###   Proportional Hazards Model with a Multivariate Continuous Mark,
###   Missing-at-Random in Some Failures
### Aliases: sievePHaipw

### ** Examples

n <- 500
tx <- rep(0:1, each=n / 2)
tm <- c(rexp(n / 2, 0.2), rexp(n / 2, 0.2 * exp(-0.4)))
cens <- runif(n, 0, 15)
eventTime <- pmin(tm, cens, 3)
eventInd <- as.numeric(tm <= pmin(cens, 3))
mark1 <- ifelse(eventInd==1, c(rbeta(n / 2, 2, 5), rbeta(n / 2, 2, 2)), NA)
mark2 <- ifelse(eventInd==1, c(rbeta(n / 2, 1, 3), rbeta(n / 2, 5, 1)), NA)
# a continuous auxiliary covariate
A <- (mark1 + 0.4 * runif(n)) / 1.4
linPred <- -0.8 + 0.4 * tx + 0.8 * A
probs <- exp(linPred) / (1 + exp(linPred))
R <- rep(NA, length(probs))
while (sum(R, na.rm=TRUE) < 10){
  R[eventInd==1] <- sapply(probs[eventInd==1], function(p){ rbinom(1, 1, p) })
}
# produce missing-at-random marks
mark1[eventInd==1] <- ifelse(R[eventInd==1]==1, mark1[eventInd==1], NA)
mark2[eventInd==1] <- ifelse(R[eventInd==1]==1, mark2[eventInd==1], NA)

# fit a model with a bivariate mark
fit <- sievePHaipw(eventTime, eventInd, mark=data.frame(mark1, mark2), tx,
                   aux=data.frame(A), formulaMiss= ~ tx * A, formulaScore= ~ tx * A + I(A^2))




