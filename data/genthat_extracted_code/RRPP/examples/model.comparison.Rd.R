library(RRPP)


### Name: model.comparison
### Title: Model Comparisons, in terms of the log-likelihood or covariance
###   trace
### Aliases: model.comparison
### Keywords: analysis

### ** Examples


data(Pupfish)
Pupfish$logSize <- log(Pupfish$CS)
fit1 <- lm.rrpp(coords ~ logSize, data = Pupfish, iter = 0, print.progress = FALSE)
fit2 <- lm.rrpp(coords ~ Pop, data = Pupfish, iter = 0, print.progress = FALSE)
fit3 <- lm.rrpp(coords ~ Sex, data = Pupfish, iter = 0, print.progress = FALSE)
fit4 <- lm.rrpp(coords ~ logSize + Sex, data = Pupfish, iter = 0, print.progress = FALSE)
fit5 <- lm.rrpp(coords ~ logSize + Pop, data = Pupfish, iter = 0, print.progress = FALSE)
fit6 <- lm.rrpp(coords ~ logSize + Sex * Pop, data = Pupfish, iter = 0, print.progress = FALSE)

modComp1 <- model.comparison(fit1, fit2, fit3, fit4, fit5, fit6, type = "cov.trace")
modComp2 <- model.comparison(fit1, fit2, fit3, fit4, fit5, fit6, type = "logLik")

summary(modComp1)
summary(modComp2)

par(mfcol = c(1,2))
plot(modComp1)
plot(modComp2)




