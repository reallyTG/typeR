library(tsensembler)


### Name: update_ade_meta
### Title: Updating the metalearning layer of an ADE model
### Aliases: update_ade_meta update_ade_meta,ADE-method

### ** Examples

## Not run: 
##D specs <- model_specs(
##D  learner = c("bm_svr", "bm_glm", "bm_mars"),
##D  learner_pars = NULL
##D )
##D 
##D data("water_consumption")
##D dataset <- embed_timeseries(water_consumption, 5)
##D train <- dataset[1:1000, ]
##D validation <- dataset[1001:1200, ]
##D test <- dataset[1201:1500, ]
##D 
##D model <- ADE(target ~., train, specs)
##D 
##D preds_val <- predict(model, validation)
##D model <- update_ade_meta(model, rbind.data.frame(train, validation))
##D 
##D preds_test <- predict(model, test)
## End(Not run)




