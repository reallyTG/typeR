library(KFAS)


### Name: coef.SSModel
### Title: Smoothed Estimates or One-step-ahead Predictions of States
### Aliases: coef.SSModel coef.KFS coef.SSModel

### ** Examples


model <- SSModel(log(drivers) ~ SSMtrend(1, Q = list(1)) +
 SSMseasonal(period = 12, sea.type = "trigonometric") +
 log(PetrolPrice) + law, data = Seatbelts, H = 1)

coef(model, states = "regression", last = TRUE)
coef(model, start = c(1983, 12), end = c(1984, 2))
out <- KFS(model)
coef(out, states = "regression", last = TRUE)
coef(out, start = c(1983, 12), end = c(1984, 2))




