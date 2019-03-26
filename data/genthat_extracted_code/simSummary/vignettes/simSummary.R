### R code from vignette source 'simSummary.Rnw'

###################################################
### code chunk number 1: parameters
###################################################
## Process (lamb growth) parameters
xMin  <- 40            ## minimal age
xMax  <- 80            ## maximal age
alpha <- 20            ## ave. weight at 60 days
beta  <- 0.35          ## growth rate
sdE   <- 2             ## residual variation
 
## Simulation parameters
nY <- c(10, 100, 1000) ## scenarios
nS <- length(nY)       ## no. scenarios
nR <- 100              ## no. replications


###################################################
### code chunk number 2: containers
###################################################
## Outer list
sim <- vector(mode="list", length=nR)
## Inner list
simI <- vector(mode="list", length=2)
names(simI) <- c("coef", "R2")
simI$coef <- matrix(nrow=2, ncol=nS)
simI$R2   <- matrix(nrow=1, ncol=nS)
colnames(simI$coef) <- colnames(simI$R2) <- nY
rownames(simI$coef) <- c("alpha", "beta")


###################################################
### code chunk number 3: simulation
###################################################
for(i in 1:nR) {
  sim[[i]] <- simI
  for(j in 1:nS) {
    x <- runif(n=nY[j], min=xMin, max=xMax) - 60
    y <- alpha + beta * x + rnorm(n=nY[j], sd=sdE)
    tmp <- lm(y ~ x)
    sim[[i]]$coef[, j] <- coef(tmp)
    sim[[i]]$R2[j] <- summary(tmp)$r.squared
  }
}
sim[1:2]


###################################################
### code chunk number 4: summary
###################################################
# install.packages(pkg="simSummary")
library(package="simSummary")
simSummary(x=sim, FUN=c("mean", "sd"))


###################################################
### code chunk number 5: summary2
###################################################
## Mimick simulation in progress
sim[[100]]$coef[] <- NA
sim[[100]]$R2[]   <- NA
simSummary(x=sim, FUN=c("nobs", "mean"),
           na.rm=TRUE)


###################################################
### code chunk number 6: sessionInfo
###################################################
sessionInfo()


