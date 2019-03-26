library(conditions)


### Name: as_message
### Title: Convert Conditions
### Aliases: as_assertion_error as_assertion_message as_assertion_warning
###   as_deprecated_error as_deprecated_message as_deprecated_warning
###   as_dimension_error as_dimension_message as_dimension_warning as_error
###   as_future_error as_future_message as_future_warning as_index_error
###   as_index_message as_index_warning as_io_error as_io_message
###   as_io_warning as_length_error as_length_message as_length_warning
###   as_library_error as_library_message as_library_warning
###   as_lookup_error as_lookup_message as_lookup_warning as_message
###   as_missing_error as_missing_message as_missing_warning as_name_error
###   as_name_message as_name_warning as_runtime_error as_runtime_message
###   as_runtime_warning as_type_error as_type_message as_type_warning
###   as_value_error as_value_message as_value_warning as_warning

### ** Examples

# Turn the warning of sqrt() into a value message
message(tryCatch(sqrt(-1), warning = as_value_message()))

## Not run: 
##D # Turn the warning of sqrt() into a value error
##D tryCatch(sqrt(-1), warning = as_value_error())
##D 
##D # Or, alternatively with a custom message:
##D tryCatch(sqrt(-1), warning = as_value_error("sqrt of negative value"))
## End(Not run)



