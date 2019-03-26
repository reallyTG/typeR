library(sglg)


### Name: survglg
### Title: Fitting linear generalized log-gamma regression models under the
###   presence of right censored data.
### Aliases: survglg

### ** Examples

rows  <- 240
columns <- 3
t_beta  <- c(0.7, 0.5, 2)
t_sigma <- 1.5
t_lambda <- sigma
set.seed(8142031)
library(ssym)
x2 <- rbinom(rows, 1, 0.5)
x3 <- runif(rows, 0, 1)
X <- cbind(1,x2,x3)
s         <- t_sigma^2
a         <- 1/s
t_ini1    <- exp(X %*% t_beta) * rgamma(rows, scale = s, shape = a)
cens.time <- rweibull(rows, 0.4, 14)
delta1     <- ifelse(t_ini1 > cens.time, 1, 0)
obst1 <- t_ini1
for (i in 1:rows) {
if (delta1[i] == 1) {
   obst1[i] <- cens.time[i]
  }
}
data.example <- data.frame(obst1,delta1,X)
fit3 <- survglg(Surv(log(obst1),delta1) ~ x2 + x3 , data=data.example,shape=1)
summary(fit3)
plot(fit3)



