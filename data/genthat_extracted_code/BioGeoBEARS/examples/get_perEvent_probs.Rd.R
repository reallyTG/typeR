library(BioGeoBEARS)


### Name: get_perEvent_probs
### Title: Get the per-event probabilities at cladogenesis
### Aliases: get_perEvent_probs

### ** Examples

# default DEC+J model
BioGeoBEARS_run_object = define_BioGeoBEARS_run()
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table
params_table = BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table
params_table

get_perEvent_probs(params_table)


# DEC+J model
BioGeoBEARS_run_object = define_BioGeoBEARS_run()
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","type"] = "free"
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","init"] = 1
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","est"] = 1

BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table

BioGeoBEARS_run_object$BioGeoBEARS_model_object =
calc_linked_params_BioGeoBEARS_model_object(
BioGeoBEARS_model_object=BioGeoBEARS_run_object$BioGeoBEARS_model_object,
update_init=TRUE)


BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table
params_table = BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table

get_perEvent_probs(params_table)



