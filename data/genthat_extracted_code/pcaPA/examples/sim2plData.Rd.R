library(pcaPA)


### Name: sim2plData
### Title: Simulated data conforming to the 2pl model.
### Aliases: sim2plData
### Keywords: datasets

### ** Examples

data(sim2plData)
binary2plPA <- PA(sim2plData, percentiles = c(0.95, 0.99), nReplicates = 200,
                  type = "binary", algorithm = "polychoric")
print(binary2plPA)



