library(ddpcr)


### Name: variable_dim
### Title: Variable dimension in a PNPP experiment
### Aliases: variable_dim variable_dim<-
### Keywords: internal

### ** Examples

plate <- new_plate(dir = sample_data_dir(), type = plate_types$pnpp_experiment)
variable_dim(plate) <- "Y"
variable_dim(plate)
positive_dim(plate)



