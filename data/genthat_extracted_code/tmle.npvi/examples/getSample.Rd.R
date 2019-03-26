library(tmle.npvi)


### Name: getSample
### Title: Generates Simulated Data
### Aliases: getSample

### ** Examples

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
str(sim)

obs <- sim$obs
head(obs)
pairs(obs)

## Adding (dummy) baseline covariates
V <- matrix(runif(3*nrow(obs)), ncol=3)
colnames(V) <- paste("V", 1:3, sep="")
obsV <- cbind(V, obs)
head(obsV)

## True psi and confidence intervals (case 'f=identity')      
sim01 <- getSample(1e4, O, lambda0, p=p, omega=omega, sigma2=1, Sigma3=S)
truePsi1 <- sim01$psi

confInt01 <- truePsi1+c(-1, 1)*qnorm(.975)*sqrt(sim01$varIC/nrow(sim01$obs))
confInt1 <- truePsi1+c(-1, 1)*qnorm(.975)*sqrt(sim01$varIC/nrow(obs))
msg <- "\nCase f=identity:\n"
msg <- c(msg, "\ttrue psi is: ", paste(signif(truePsi1, 3)), "\n")
msg <- c(msg, "\t95%-confidence interval for the approximation is: ", 
         paste(signif(confInt01, 3)), "\n")
msg <- c(msg, "\toptimal 95%-confidence interval is: ", 
         paste(signif(confInt1, 3)), "\n")
cat(msg)

## True psi and confidence intervals (case 'f=atan')
f2 <- function(x) {1*atan(x/1)}
sim02 <- getSample(1e4, O, lambda0, p=p, omega=omega, sigma2=1, Sigma3=S, f=f2);
truePsi2 <- sim02$psi;

confInt02 <- truePsi2+c(-1, 1)*qnorm(.975)*sqrt(sim02$varIC/nrow(sim02$obs))
confInt2 <- truePsi2+c(-1, 1)*qnorm(.975)*sqrt(sim02$varIC/nrow(obs))

msg <- "\nCase f=atan:\n"
msg <- c(msg, "\ttrue psi is: ", paste(signif(truePsi2, 3)), "\n")
msg <- c(msg, "\t95%-confidence interval for the approximation is: ", 
         paste(signif(confInt02, 3)), "\n")
msg <- c(msg, "\toptimal 95%-confidence interval is: ", 
         paste(signif(confInt2, 3)), "\n")
cat(msg)



