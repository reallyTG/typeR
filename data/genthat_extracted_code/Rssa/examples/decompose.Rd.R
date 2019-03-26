library(Rssa)


### Name: decompose
### Title: Perform SSA Decomposition
### Aliases: decompose decompose.default decompose.ssa decompose.cssa
###   decompose.toeplitz.ssa

### ** Examples

# Decompose 'co2' series with default parameters and decomposition turned off.
s <- ssa(co2, force.decompose = FALSE, svd.method = "nutrlan")
# Perform the decomposition
decompose(s, neig = 50)
# Continue the decomposition
decompose(s, neig = 100)



