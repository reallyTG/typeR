library(island)


### Name: irregular_single_dataset
### Title: c/e rates for irregular samplings in a dataset
### Aliases: irregular_single_dataset NLL_isd

### ** Examples

irregular_single_dataset(simberloff[[1]], 3:17, 0.001, 0.001)
irregular_single_dataset(simberloff[[1]], 3:17, column = "Tax. Unit 1",
0.001, 0.001, 3)
## Not run: 
##D irregular_single_dataset(simberloff[[1]], 3:17, column = "Tax. Unit 1",
##D 0.001, 0.001, 3, 0.00001)
## End(Not run)
NLL_isd(simberloff[[1]], 3:17, 0.0038, 0.0086)



