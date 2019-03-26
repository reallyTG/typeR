library(parfm)


### Name: predict.parfm
### Title: Predictions of frailty values for Parametric Frailty Models
### Aliases: predict.parfm plot.predict.parfm print.predict.parfm
### Keywords: frailty prediction frailty prediction

### ** Examples

data(kidney)
kidney$sex <- kidney$sex - 1

model <- parfm(Surv(time,status) ~ sex + age, 
               cluster = "id", data = kidney,
               dist = "exponential", frailty = "gamma")
u <- predict(model)
u


# Predictions from semi-parametric Gamma frailty model
# via coxph() function
model.coxph <- coxph(Surv(time,status) ~ sex + age + 
                         frailty(id, frailty = "gamma", eps = 1e-11), 
                     outer.max = 15, data = kidney)
u.coxph <- exp(model.coxph$frail)


# Plot of predictions from both models
par(mfrow = c(1,2))
ylim <- c(0, max(c(u, u.coxph)))
plot(u, sort = "i",
     main = paste("Parametric", 
                  "Gamma frailty model",
                  "with Exponential baseline", 
                  sep = "\n"),
     ylim = ylim)

names(u.coxph) <- kidney[seq(2,76, 2), "id"]
class(u.coxph) <- "predict.parfm"
attr(u.coxph, "clustname") <- "id"
plot(u.coxph, sort = "i",
     main = paste("Semi-parametric",
                  "Gamma frailty model", sep = "\n"),
     ylim = ylim)



