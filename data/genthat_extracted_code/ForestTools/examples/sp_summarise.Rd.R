library(ForestTools)


### Name: sp_summarise
### Title: Spatial Summarization
### Aliases: sp_summarise

### ** Examples

# Load sample data
library(ForestTools)
library(sp)
data("kootenayTrees", "kootenayBlocks", "kootenayCrowns")

# Get total tree count
sp_summarise(kootenayTrees)

# Get total tree count, tree height and crown area statistics
sp_summarise(kootenayCrowns, variables = c("height", "crownArea"))

# Get tree count, height statistics for specific areas of interest
areaStats <- sp_summarise(kootenayTrees, areas = kootenayBlocks, variables = "height")

# Plot according to tree count
plot(areaStats, col = heat.colors(3)[order(areaStats$TreeCount)])

# Get tree count and height statistics for a 20 x 20 m spatial grid
gridStats <- sp_summarise(kootenayTrees, grid = 20, variables = "height")

# Plot gridded tree count and statistics
plot(gridStats$TreeCount)
plot(gridStats$heightMax)




