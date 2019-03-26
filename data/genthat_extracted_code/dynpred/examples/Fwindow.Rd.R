library(dynpred)


### Name: Fwindow
### Title: Calculate dynamic "death within window" curve
### Aliases: Fwindow
### Keywords: univar

### ** Examples

data(wbc1)
c0 <- coxph(Surv(tyears, d) ~ 1, data = wbc1, method="breslow")
sf0 <- survfit(c0)
Fw <- Fwindow(sf0,4)



