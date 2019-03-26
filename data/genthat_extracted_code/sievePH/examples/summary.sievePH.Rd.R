library(sievePH)


### Name: summary.sievePH
### Title: Summarizing Mark-Specific Proportional Hazards Model Fits
### Aliases: summary.sievePH print.summary.sievePH

### ** Examples

n <- 500
tx <- rep(0:1, each=n/2)
tm <- c(rexp(n/2, 0.2), rexp(n/2, 0.2 * exp(-0.4)))
cens <- runif(n, 0, 15)
eventTime <- pmin(tm, cens, 3)
eventInd <- as.numeric(tm <= pmin(cens, 3))
mark1 <- ifelse(eventInd==1, c(rbeta(n/2, 2, 5), rbeta(n/2, 2, 2)), NA)
mark2 <- ifelse(eventInd==1, c(rbeta(n/2, 1, 3), rbeta(n/2, 5, 1)), NA)

# fit a model with a bivariate mark
fit <- sievePH(eventTime, eventInd, data.frame(mark1, mark2), tx)
sfit <- summary(fit, markGrid=matrix(c(0.3, 0.3, 0.6, 0.3, 0.3, 0.6, 0.6, 0.6),
                                     ncol=2, byrow=TRUE))
# print the formatted summary
sfit
# treatment efficacy estimates on the grid
sfit$te




