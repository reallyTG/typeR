library(simSummary)


### Name: simSummary
### Title: Simulation summary
### Aliases: simSummary

### ** Examples


## Create simple input from a rather silly simulation
simFun <- function(x)
{
  ret <- list()
  ret$s <- rnorm(n=1)
  ret$v <- rnorm(n=5)
  ret$m <- matrix(rnorm(n=5*5), nrow=5, ncol=5)
  ret$a <- array(rnorm(n=4*3*2), dim=c(4, 3, 2))
  ret
}
sim <- list()
sim$sim1 <- simFun()
sim$sim2 <- simFun(x=0)
sim$sim3 <- simFun(x=1)

## Simulation summary (just mean and standard deviation)
simSummary(x=sim, FUN=c("mean", "sd"))

## Can handle simulations in process too = handle NA values
sim$sim3$s <- NA
sim$sim3$v[5] <- NA
simSummary(x=sim, FUN="mean")
simSummary(x=sim, FUN="mean", na.rm=TRUE)

## Unit tests (automatic run elsewhere)
## summary(runTest(test(simSummary)))




