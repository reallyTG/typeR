library(AHR)


### Name: aj
### Title: aj
### Aliases: aj

### ** Examples

## competing risks
T <- rexp(100)
C <- rexp(100)
r <- rbinom(100, 2, 0.5)
r[(r == 0) | (T > C)] <- "cens"
data <- data.frame(id=1:100, time=pmin(T,C), from=rep(0, 100), to=r)
data <- data[order(data$time),]
tra <- matrix(FALSE, nrow=3, ncol=3)
tra[1, 2:3] <- TRUE
# estimate cumulative incidence function for event type 1
fit <- aj(sort(data$time), data, list(target="0 1", states=c("0", "1", "2"), transitions=tra,
   censoring="cens", s=0, t="last", covariance=TRUE))



