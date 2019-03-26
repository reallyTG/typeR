library(intccr)


### Name: predict.ciregic
### Title: Covariate-Specific Cumulative Incidence Prediction
### Aliases: predict.ciregic

### ** Examples

## Continuing the ciregic(...) example
## Don't show: 
newdata <- dataprep(data = longdata, ID = "id", time = "t",
                    event = "c", Z = c("z1", "z2"))
fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
               alpha = c(1, 1), nboot = 0, do.par = FALSE)
## End(Don't show)
pfit <- predict(object = fit, covp = c(1, 0.5), times = c(0.1, 0.15, 0.5, 0.7))
pfit
mint <- fit$tms[1]
maxt <- fit$tms[2]
pfit1 <- predict(object = fit, covp = c(1, 0.5),
                 times = seq(mint, maxt, by = (maxt-mint)/99))
plot(pfit1$t, pfit1$cif1, ylim = c(0, 1), type = "l")
lines(pfit1$t, pfit1$cif2, ylim = c(0, 1), lty = 2, col = 2)



