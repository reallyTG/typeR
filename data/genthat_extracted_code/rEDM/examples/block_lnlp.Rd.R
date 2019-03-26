library(rEDM)


### Name: block_lnlp
### Title: Perform generalized forecasting using simplex projection or
###   s-map
### Aliases: block_lnlp

### ** Examples

data("two_species_model")
block <- two_species_model[1:200,]
block_lnlp(block, columns = c("x", "y"), first_column_time = TRUE)




