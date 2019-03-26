library(ddpcr)


### Name: meta_var_name
### Title: Name of variable in PNPP experiment metadata
### Aliases: meta_var_name
### Keywords: internal

### ** Examples

plate <- new_plate(dir = sample_data_dir(), type = plate_types$pnpp_experiment)
negative_name(plate) <- "mutant"
meta_var_name(plate, 'num_negative_drops')



