library(tsDyn)


### Name: nlar methods
### Title: nlar methods
### Aliases: nlar-methods AIC.nlar coef.nlar fitted.nlar mse.nlar MAPE.nlar
###   print.nlar residuals.nlar summary.nlar plot.nlar toLatex.nlar
### Keywords: ts

### ** Examples

x <- log10(lynx)
mod.setar <- setar(x, m=2, thDelay=1, th=3.25)
mod.setar
AIC(mod.setar)
mse(mod.setar)
MAPE(mod.setar)
coef(mod.setar)
summary(mod.setar)

e <- residuals(mod.setar)
e <- e[!is.na(e)]
plot(e)
acf(e)

plot(x)
lines(fitted(mod.setar), lty=2)
legend(x=1910, y=3.9,lty=c(1,2), legend=c("observed","fitted"))

plot(mod.setar)



