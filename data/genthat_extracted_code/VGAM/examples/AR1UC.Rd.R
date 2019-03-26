library(VGAM)


### Name: dAR1
### Title: The AR-1 Autoregressive Process
### Aliases: dAR1 dAR1
### Keywords: distribution

### ** Examples

nn <- 100; set.seed(1)
tdata <- data.frame(index = 1:nn,
                    TS1 = arima.sim(nn, model = list(ar = -0.50),
                                    sd = exp(1)))
fit1 <- vglm(TS1 ~ 1, AR1, data = tdata, trace = TRUE)
rhobit(-0.5)
coef(fit1, matrix = TRUE)
(Cfit1 <- Coef(fit1))
summary(fit1)  # SEs are useful to know
logLik(fit1)
sum(dAR1(depvar(fit1), drift = Cfit1[1], var.error = (Cfit1[2])^2,
         ARcoef1 = Cfit1[3], log = TRUE))

fit2 <- vglm(TS1 ~ 1, AR1(type.likelihood = "cond"), data = tdata, trace = TRUE)
(Cfit2 <- Coef(fit2))  # Okay for intercept-only models
logLik(fit2)
head(keep <- dAR1(depvar(fit2), drift = Cfit2[1], var.error = (Cfit2[2])^2,
                  ARcoef1 = Cfit2[3], type.likelihood = "cond", log = TRUE))
sum(keep[-1])



