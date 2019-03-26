library(tsensembler)


### Name: build_base_ensemble
### Title: Wrapper for creating an ensemble
### Aliases: build_base_ensemble

### ** Examples

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
specs <- model_specs(c("bm_ppr","bm_svr"), NULL)
M <- build_base_ensemble(target ~., dataset, specs)




