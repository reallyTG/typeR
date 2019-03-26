library(sievePH)


### Name: plot.summary.sievePH
### Title: Plotting Mark-Specific Proportional Hazards Model Fits
### Aliases: plot.summary.sievePH

### ** Examples

n <- 500
tx <- rep(0:1, each=n/2)
tm <- c(rexp(n/2, 0.2), rexp(n/2, 0.2 * exp(-0.4)))
cens <- runif(n, 0, 15)
eventTime <- pmin(tm, cens, 3)
eventInd <- as.numeric(tm <= pmin(cens, 3))
mark <- ifelse(eventInd==1, c(rbeta(n/2, 2, 5), rbeta(n/2, 2, 2)), NA)
markRng <- range(mark, na.rm=TRUE)

# fit a model with a univariate mark
fit <- sievePH(eventTime, eventInd, mark, tx)
sfit <- summary(fit, markGrid=seq(markRng[1], markRng[2], length.out=10))
plot(sfit, mark, tx)




