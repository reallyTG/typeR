library(tsensembler)


### Name: update_ade
### Title: Updating an ADE model
### Aliases: update_ade update_ade,ADE-method

### ** Examples

specs <- model_specs(
 learner = c("bm_svr", "bm_glm", "bm_mars"),
 learner_pars = NULL
)

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
# toy size for checks
train <- dataset[1:300, ]
validation <- dataset[301:400, ]
test <- dataset[401:500, ]

model <- ADE(target ~., train, specs)

preds_val <- predict(model, validation)
model <- update_ade(model, rbind.data.frame(train, validation))

preds_test <- predict(model, test)





