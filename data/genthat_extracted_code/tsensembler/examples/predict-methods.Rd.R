library(tsensembler)


### Name: predict
### Title: Predicting new observations using an ensemble
### Aliases: predict predict.ade predict.dets predict.base
###   predict,ADE-method predict,DETS-method predict,base_ensemble-method

### ** Examples


###### Predicting with an ADE ensemble

specs <- model_specs(
 learner = c("bm_glm", "bm_mars"),
 learner_pars = NULL
)

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
train <- dataset[1:1000, ]
test <- dataset[1001:1500, ]

model <- ADE(target ~., train, specs)

preds <- predict(model, test)


## Not run: 
##D 
##D ###### Predicting with a DETS ensemble
##D 
##D specs <- model_specs(
##D  learner = c("bm_svr", "bm_glm", "bm_mars"),
##D  learner_pars = NULL
##D )
##D 
##D data("water_consumption")
##D dataset <- embed_timeseries(water_consumption, 5)
##D train <- dataset[1:700, ]
##D test <- dataset[701:1000, ]
##D 
##D model <- DETS(target ~., train, specs, lambda = 50, omega = .2)
##D 
##D preds <- predict(model, test)
## End(Not run)


## Not run: 
##D ###### Predicting with a base ensemble
##D 
##D model <- ADE(target ~., train, specs)
##D 
##D basepreds <- predict(model@base_ensemble, test)
## End(Not run)





