library(BioGeoBEARS)


### Name: calc_linked_params_BioGeoBEARS_model_object
### Title: Update parameters that are deterministic functions of free
###   parameters
### Aliases: calc_linked_params_BioGeoBEARS_model_object

### ** Examples

# Define a BioGeoBEARS run object
BioGeoBEARS_run_object = define_BioGeoBEARS_run()
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table

# Set 'j' to be free, i.e. as in a DEC+J model (adding jump dispersal
# to the LAGRANGE DEC model)
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","type"] = "free"
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","init"] = 0.25
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table["j","est"] = 0.25

# Display result
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table

# Update the other parameters
BioGeoBEARS_run_object$BioGeoBEARS_model_object =
calc_linked_params_BioGeoBEARS_model_object(
BioGeoBEARS_model_object=BioGeoBEARS_run_object$BioGeoBEARS_model_object)

# Display result
BioGeoBEARS_run_object$BioGeoBEARS_model_object@params_table



