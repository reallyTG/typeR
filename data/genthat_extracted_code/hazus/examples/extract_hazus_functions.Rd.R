library(hazus)


### Name: extract_hazus_functions
### Title: Extract HAZUS damage functions for specified function type
### Aliases: extract_hazus_functions

### ** Examples

# depth-damage functions
fl_dept <- extract_hazus_functions()
# depth-damage functions, raw data only
fl_dept <- extract_hazus_functions(long_format = FALSE)
# velocity-depth-damage functions
fl_velo <- extract_hazus_functions(func_type = "velocity")
# agriculture damage functions
fl_agri <- extract_hazus_functions(func_type = "ag")
# bridge damage functions
fl_bridge <- extract_hazus_functions(func_type = "bridge")
# depreciation functions
fl_depr <- extract_hazus_functions(func_type = "deprec")
# columns names of all flood damage functions
lapply(ls(pattern = "fl_"), FUN = function(x) colnames(get(x)))
# flood occupancy types and description
data(haz_fl_occ)
head(haz_fl_occ)



