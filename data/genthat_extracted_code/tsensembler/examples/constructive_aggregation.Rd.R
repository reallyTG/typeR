library(tsensembler)


### Name: constructive_aggregation
### Title: Constructive aggregation constructor
### Aliases: constructive_aggregation

### ** Examples

specs <- model_specs(
  learner = c("bm_ppr", "bm_svr", "bm_mars"),
  learner_pars = list(
    bm_glm = list(alpha = c(0, .5, 1)),
    bm_svr = list(kernel = c("rbfdot", "polydot"),
                  C = c(1, 3)),
    bm_ppr = list(nterms = 4)
  )
)

data("water_consumption")
waterc <- embed_timeseries(water_consumption, 5)
train <- waterc[1:300, ] # toy size for checks
test  <- waterc[301:320, ] # toy size for checks

model <- constructive_aggregation(target ~., train, specs, 10,5,NULL,"window_loss","simple")
preds <- predict(model, test)




