library(CVST)


### Name: constructParams
### Title: Construct a Grid of Parameters
### Aliases: constructParams

### ** Examples

params = constructParams(kernel="rbfdot", sigma=10^(-1:5), nu=c(0.1, 0.2))
# the expanded grid contains 14 parameter lists:
length(params)



