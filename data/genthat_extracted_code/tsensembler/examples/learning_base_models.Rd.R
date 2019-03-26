library(tsensembler)


### Name: learning_base_models
### Title: Training the base models of an ensemble
### Aliases: learning_base_models

### ** Examples

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
specs <- model_specs(c("bm_ppr","bm_svr"), NULL)
M <- build_base_ensemble(target ~., dataset, specs)




