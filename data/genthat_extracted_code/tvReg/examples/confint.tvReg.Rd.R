library(tvReg)


### Name: confint.tvlm
### Title: Confidence Intervals for Model Parameters of Objects in tvReg
### Aliases: confint.tvlm confint.tvsure confint.tvirf

### ** Examples


##Calculation of confidence intervals for a tvLM model
tau <- seq(1:500)/500
beta <- data.frame(beta1 = sin(2*pi*tau), beta2= 2*tau)
X1 <- rnorm(500)
X2 <- rchisq(500, df = 4)
error <- rt(500, df = 10)
y <- apply(cbind(X1, X2)*beta, 1, sum) + error
data <- data.frame(y = y, X1 = X1, X2 = X2)
model.tvlm <-  tvLM(y ~ 0 + X1 + X2, data = data, bw = 0.1)
tvci <- confint(model.tvlm, level = 0.95, runs = 30)
plot(tvci)

##The second time is much faster when the level is changed
##if the user uses the previous information
tvci.80 <- confint(tvci, level = 0.8)




