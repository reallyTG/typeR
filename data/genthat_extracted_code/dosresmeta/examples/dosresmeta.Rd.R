library(dosresmeta)


### Name: dosresmeta
### Title: Multivariate Dose-Response Meta-Analysis
### Aliases: dosresmeta dosresmeta.fit

### ** Examples

## First example: Single case-control study
## Linear trend estimation
data("cc_ex")

## Fitting the model
mod1 <- dosresmeta(formula = logrr ~ dose, type = "cc", cases = case,
                   n = n, lb = lb, ub = ub, data= cc_ex)
summary(mod1)
## Results
predict(mod1, delta = 1, expo = TRUE)


## Second example: Multiple studies
## Linear and quadratic trend using random-effects meta-analysis
data("alcohol_cvd")

## Linear trend
lin <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                  se = se, cases = cases, n = n, data = alcohol_cvd)
summary(lin)
## Predicted linear trend
predict(lin, delta = 1, expo = TRUE)

## Non-linear (quadratic) trend
quadr <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd)
summary(quadr)

## Graphical results
with(predict(quadr, expo = TRUE, order = TRUE), {
   plot(dose, pred, log = "y", type = "l",
        xlim = c(0, 45), ylim = c(.4, 2))
   lines(dose,  ci.lb, lty = 2)
   lines(dose, ci.ub, lty = 2)
   rug(dose, quiet = TRUE)
})


## Third example: Continous outcome (smd)
data("ari")
mod3 <- dosresmeta(formula = y ~ dose + I(dose^2), id = id,
                   sd = sd, n = n, covariance = "smd", data = ari)
summary(mod3)

## Graphical results
newdata <- data.frame(dose = seq(0, 30, 1))
with(predict(mod3, newdata, order = TRUE), {
   plot(dose, pred, type = "l",
        ylim = c(0, .6))
   lines(dose,  ci.lb, lty = 2)
   lines(dose, ci.ub, lty = 2)
   rug(dose, quiet = TRUE)
})



