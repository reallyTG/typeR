library(dosresmeta)


### Name: predict.dosresmeta
### Title: Predicted Values from dosresmeta Models
### Aliases: predict.dosresmeta

### ** Examples

## Load data and run the linear and quadratic models
data("alcohol_cvd")
lin <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                  se = se, cases = cases, n = n, data = alcohol_cvd) 
quadr <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd) 

## Predicted linear trend (on RR scale)
predict(lin, delta = 12, expo = TRUE)

## Predicted modeled data from quadratic model (on RR scale)
predict(quadr, expo = TRUE)

## Plot predicted dose-response relation
with(predict(quadr, order = TRUE, expo = TRUE), {
   plot(dose, pred, log = "y", type = "l",
        xlim = c(0, 45), ylim = c(.4, 2))
   lines(dose,  ci.lb, lty = 2)
   lines(dose, ci.ub, lty = 2)
   rug(dose, quiet = TRUE)
})

## Prediction for new values from quadratic model (on RR scale)
newdata <- data.frame(dose = seq(0, 50, 5))
predict(quadr, newdata, expo = TRUE)

## Loading data
data("ari")

mod <- dosresmeta(y ~ dose + I(dose^2), id = id, sd = sd,
 n = n, data = ari, covariance = "smd")

## Smoothed plot
newdata <- data.frame(dose = seq(0, 30, 1))
with(predict(mod, newdata), {
   plot(dose, pred, type = "l", ylim = c(0, .6))
   lines(dose,  ci.lb, lty = 2)
   lines(dose, ci.ub, lty = 2)
   rug(dose, quiet = TRUE)
})




