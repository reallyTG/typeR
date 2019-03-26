library(rEDM)


### Name: block_gp
### Title: (generalized) Block forecasting using Gaussian Processes
### Aliases: block_gp

### ** Examples

data("two_species_model")
block <- two_species_model[1:200,]
block_gp(block, columns = c("x", "y"), first_column_time = TRUE)




