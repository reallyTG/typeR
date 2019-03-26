library(tmle.npvi)


### Name: tmle.npvi
### Title: Targeted Minimum Loss Estimation of NPVI
### Aliases: tmle.npvi tmle.npvi

### ** Examples

set.seed(12345)
##
## Simulating a data set and computing the true value of the parameter
##

## Parameters for the simulation (case 'f=identity')
O <- cbind(W=c(0.05218652, 0.01113460),
           X=c(2.722713, 9.362432),
           Y=c(-0.4569579, 1.2470822))
O <- rbind(NA, O)
lambda0 <- function(W) {-W}
p <- c(0, 1/2, 1/2)
omega <- c(0, 3, 3)
S <- matrix(c(10, 1, 1, 0.5), 2 ,2)

## Simulating a data set of 200 i.i.d. observations
sim <- getSample(2e2, O, lambda0, p=p, omega=omega, sigma2=1, Sigma3=S)
obs <- sim$obs

## Adding (dummy) baseline covariates
V <- matrix(runif(3*nrow(obs)), ncol=3)
colnames(V) <- paste("V", 1:3, sep="")
obs <- cbind(V, obs)

## Caution! MAKING '0' THE REFERENCE VALUE FOR 'X'
X0 <- O[2,2]
obsC <- obs
obsC[, "X"] <- obsC[, "X"] - X0
obs <- obsC

## True psi and confidence intervals (case 'f=identity')      
sim <- getSample(1e4, O, lambda0, p=p, omega=omega, sigma2=1, Sigma3=S)
truePsi <- sim$psi

confInt0 <- truePsi + c(-1, 1)*qnorm(.975)*sqrt(sim$varIC/nrow(sim$obs))
confInt <- truePsi + c(-1, 1)*qnorm(.975)*sqrt(sim$varIC/nrow(obs))
cat("\nCase f=identity:\n")
msg <- paste("\ttrue psi is: ", signif(truePsi, 3), "\n", sep="")
msg <- paste(msg, "\t95%-confidence interval for the approximation is: ",
             signif(confInt0, 3), "\n", sep="")
msg <- paste(msg, "\toptimal 95%-confidence interval is: ",
             signif(confInt, 3), "\n", sep="")
cat(msg)

##
## TMLE procedure
##

## Running the TMLE procedure
npvi <- tmle.npvi(obs, f=identity, flavor="learning", B=5e4, nMax=10)

## Summarizing its results
npvi
setConfLevel(npvi, 0.9)
npvi

history <- getHistory(npvi)
print(round(history, 4))

hp <- history[, "psi"]
hs <- history[, "sic"]
hs[1] <- NA
ics <-  c(-1,1) %*% t(qnorm(0.975)*hs/sqrt(nrow(getObs(npvi))))

pch <- 20
ylim <- range(c(confInt, hp, ics+hp), na.rm=TRUE)

xs <- (1:length(hs))-1
plot(xs, hp, ylim=ylim, pch=pch, xlab="Iteration", ylab=expression(psi[n]),
     xaxp=c(0, length(hs)-1, length(hs)-1))
dummy <- sapply(seq(along=xs), function(x) lines(c(xs[x],xs[x]), hp[x]+ics[, x]))

abline(h=confInt, col=4)
abline(h=confInt0, col=2)




