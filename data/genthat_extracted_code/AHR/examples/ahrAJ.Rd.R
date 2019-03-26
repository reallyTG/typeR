library(AHR)


### Name: ahrAJ
### Title: ahrAJ
### Aliases: ahrAJ

### ** Examples

## competing risks
Trt <- factor(rep(c(0,1), c(100, 100)))
T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
r <- c(rbinom(100, 2, 0.5), rbinom(100, 2, 0.4))
r[(r == 0) | (T > C)] <- "cens"
data <- data.frame(id=1:200, time=pmin(T,C), from=rep(0, 200), to=r, Trt=Trt)
tra <- matrix(FALSE, nrow=3, ncol=3)
tra[1, 2:3] <- TRUE
# estimate average subdistribution hazard ratio up to L=2 for event type 1
fit <- ahrAJ(2, target="0 1", states=c("0", "1", "2"), transitions=tra, censoring="cens",
             data=data, cov=TRUE)
fit



