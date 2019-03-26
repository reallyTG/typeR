library(tsensembler)


### Name: DETS-class
### Title: Dynamic Ensemble for Time Series
### Aliases: DETS-class
### Keywords: internal

### ** Examples

specs <- model_specs(
 c("bm_ppr", "bm_svr"),
 list(bm_ppr = list(nterms = c(2, 4)),
      bm_svr = list(kernel = c("vanilladot", "polydot"), C = c(1,5)))
)

data("water_consumption")
train <- embed_timeseries(water_consumption, 5)

model <- DETS(target ~., train, specs, lambda = 30, omega = .2)




