library(EngrExpt)


### Name: tpaste
### Title: Turbidity of a toothpaste formulation
### Aliases: tpaste
### Keywords: datasets

### ** Examples

str(tpaste)
opt <- options(contrasts = c("contr.treatment", "contr.helmert"))
summary(fm6 <- lm(turbidity ~ (NaCl + temp + rate)^3, tpaste))$coefficients
qqmath(coef(fm6)[-1], xlab = "Standard normal quantiles",
       ylab = "Estimated coefficients", aspect = 1, type = c("g", "p"),
       panel = function(...){panel.qqmath(...); panel.qqmathline(...,lty=2,alpha=0.5)})
xyplot(sort(abs(coef(fm6)[-1])) ~ sqrt(qchisq(ppoints(7), df = 1)),
       xlab = "Quantiles of absolute value of the standard normal",
       ylab = "Absolute value of estimated coefficients", type = c("g","p"))
summary(fm7 <- lm(turbidity ~ NaCl * rate, tpaste))
options(opt)



