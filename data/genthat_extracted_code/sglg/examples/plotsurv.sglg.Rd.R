library(sglg)


### Name: plotsurv.sglg
### Title: Plot simultaneously the Kaplan-Meier and parametric estimators
###   of the survival function.
### Aliases: plotsurv.sglg

### ** Examples

rows  <- 240
columns <- 2
t_beta  <- c(0.5, 2)
t_sigma <- 1
t_lambda <- 1
set.seed(8142031)
library(ssym)
x1 <- rbinom(rows, 1, 0.5)
x2 <- runif(columns, 0, 1)
X <- cbind(x1,x2)
s         <- t_sigma^2
a         <- 1/s
t_ini1    <- exp(X %*% t_beta) * rgamma(rows, scale = s, shape = a)
cens.time <- rweibull(rows, 0.6, 14)
delta1     <- ifelse(t_ini1 > cens.time, 1, 0)
obst1 <- t_ini1
for (i in 1:rows) {
if (delta1[i] == 1) {
   obst1[i] <- cens.time[i]
  }
}
data.example <- data.frame(obst1,delta1,X)
fit3 <- survglg(Surv(log(obst1),delta1) ~ x1 + x2 - 1, data=data.example,shape=0.9)
plotsurv.sglg(fit3)



