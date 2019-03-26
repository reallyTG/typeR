library(INDperform)


### Name: get_sum_output
### Title: Extract specific outputs from the GAM(M) summary
### Aliases: get_sum_output
### Keywords: internal

### ** Examples

# Using some models of the Baltic Sea demo data:
sum_list <- purrr::map(model_gam_ex$model, ~mgcv::summary.gam(.) )
get_sum_output(sum_list, varname = "edf")

# Get p-val with cell argument:
get_sum_output(sum_list, "s.table", cell = 4)



