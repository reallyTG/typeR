library(berryFunctions)


### Name: sortDF
### Title: sort dataframes by column
### Aliases: sortDF
### Keywords: arith manip univar

### ** Examples

sortDF(USArrests[USArrests$Murder>11,], Assault)
sortDF(USArrests[USArrests$Murder>11,], "Assault") # safer within functions
sortDF(USArrests[USArrests$Murder>11,], 3)




