library(tsensembler)


### Name: forecast
### Title: Forecasting using an ensemble predictive model
### Aliases: forecast forecast,ADE-method forecast,DETS-method

### ** Examples

specs <- model_specs(
 learner = c("bm_svr", "bm_glm", "bm_mars"),
 learner_pars = NULL
)

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
train <- dataset[1:500, ]

model <- DETS(target ~., train, specs)
model2 <- ADE(target ~., train, specs, lambda = 30)

next_vals_dets <- forecast(model, h = 2)
next_vals_ade <- forecast(model2, h = 2)





