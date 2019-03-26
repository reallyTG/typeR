library(ROI)


### Name: ROI_plugin_add_status_code_to_db
### Title: Add Status Code to the Status Database
### Aliases: ROI_plugin_add_status_code_to_db

### ** Examples

## Not run: 
##D solver <- "ecos"
##D ROI_plugin_add_status_code_to_db(solver, 0L, "ECOS_OPTIMAL", "Optimal solution found.", 0L)
##D ROI_plugin_add_status_code_to_db(solver, -7L, "ECOS_FATAL", "Unknown problem in solver.", 1L)
##D solver <- "glpk"
##D ROI_plugin_add_status_code_to_db(solver, 5L, "GLP_OPT", "Solution is optimal.", 0L)
##D ROI_plugin_add_status_code_to_db(solver, 1L, "GLP_UNDEF", "Solution is undefined.", 1L)
## End(Not run)



