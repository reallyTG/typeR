library(blender)


### Name: blend
### Title: Calculate biotic homogenization using Jaccard's index and an
###   approximation
### Aliases: blend blend.list blend.character print.blended.landscape
###   plot.blended.landscape print.blended.landscape.bundle
###   plot.blended.landscape.bundle blended.landscape
###   blended.landscape.bundle

### ** Examples

data(PLANTS)

wy.results = blend(PLANTS[c("WY native table", "WY exotic table")])

# print a summary of the results 
wy.results

# plot contributions of individual exotic species to mean similarity
plot(wy.results)

# blend a set of five landscapes simultaneously
five.results = blend(PLANTS[1:(5 * 2)])

## Not run: 
##D   # Alternative method of calling blend using a directory
##D   five.results = blend("Users/Dave/Documents/similarity stuff/state matrices")
## End(Not run)

# print a summary of the results across all landscapes
five.results

# plot predictions vs. observations across all landscapes
plot(five.results)

# plot contributions of individual exotic species to mean similarity in 
# the first landscape
plot(five.results[[1]])


