library(reticulate)


### Name: py_function_custom_scaffold
### Title: Custom Scaffolding of R Wrappers for Python Functions
### Aliases: py_function_custom_scaffold

### ** Examples

## Not run: 
##D 
##D library(tensorflow)
##D library(stringr)
##D 
##D # Example of a `process_param_fn` to cast parameters with default values
##D # that contains "L" to integers
##D process_int_param_fn <- function(param, docs) {
##D   # Extract the list of parameters that have integer values as default
##D   int_params <- gsub(
##D     " = [-]?[0-9]+L",
##D     "",
##D     str_extract_all(docs$signature, "[A-z]+ = [-]?[0-9]+L")[[1]])
##D   # Explicitly cast parameter in the list obtained above to integer
##D   if (param %in% int_params) {
##D     param <- paste0("as.integer(", param, ")")
##D   }
##D   param
##D }
##D 
##D # Note that since the default value of parameter `k` is `1L`. It is wrapped
##D # by `as.integer()` to ensure it's casted to integer before sending it to `tf$nn$top_k`
##D # for execution. We then print out the python function result.
##D py_function_custom_scaffold(
##D   "tf$nn$top_k",
##D   r_function = "top_k",
##D   process_param_fn = process_int_param_fn,
##D   postprocess_fn = function() { "print(python_function_result)" })
##D 
## End(Not run)



