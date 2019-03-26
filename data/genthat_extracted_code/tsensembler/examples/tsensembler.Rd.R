library(tsensembler)


### Name: tsensembler
### Title: Dynamic Ensembles for Time Series Forecasting
### Aliases: tsensembler tsensembler-package

### ** Examples


## Not run: 
##D 
##D data("water_consumption")
##D # embedding time series into a matrix
##D dataset <- embed_timeseries(water_consumption, 5)
##D 
##D # splitting data into train/test
##D train <- dataset[1:1000,]
##D test <- dataset[1001:1020, ]
##D 
##D # setting up base model parameters
##D specs <- model_specs(
##D   learner = c("bm_ppr","bm_glm","bm_svr","bm_mars"), 
##D   learner_pars = list(
##D     bm_glm = list(alpha = c(0, .5, 1)),
##D     bm_svr = list(kernel = c("rbfdot", "polydot"),
##D                   C = c(1,3)),
##D     bm_ppr = list(nterms = 4)
##D   ))
##D 
##D # building the ensemble
##D model <- ADE(target ~., train, specs)
##D 
##D 
##D # forecast next value and update base and meta models
##D # every three points;
##D # in the other points, only the weights are updated
##D predictions <- numeric(nrow(test))
##D for (i in seq_along(predictions)) {
##D   predictions[i] <- predict(model, test[i, ])@y_hat
##D   if (i %% 3 == 0) {
##D     model <-
##D       update_base_models(model,
##D                          rbind.data.frame(train, test[seq_len(i), ]))
##D 
##D     model <- update_ade_meta(model, rbind.data.frame(train, test[seq_len(i), ]))
##D   }
##D   else
##D     model <- update_weights(model, test[i, ])
##D }
##D 
##D point_forecast <- forecast(model, h = 5)
##D 
##D # setting up an ensemble of support vector machines
##D specs2 <-
##D   model_specs(learner = c("bm_svr"),
##D               learner_pars = list(
##D                 bm_svr = list(kernel = c("vanilladot", "polydot",
##D                                          "rbfdot"),
##D                               C = c(1,3,6))
##D               ))
##D 
##D model <- DETS(target ~., train, specs2)
##D preds <- predict(model, test)@y_hat
##D 
## End(Not run)





