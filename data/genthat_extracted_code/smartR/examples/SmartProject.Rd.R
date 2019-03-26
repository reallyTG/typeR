library(smartR)


### Name: SmartProject
### Title: SmartProject Class
### Aliases: SmartProject
### Keywords: data

### ** Examples

# Initialize SmartProject
yourSmartRstudy <- SmartProject$new()

# Initialize fleet object
yourSmartRstudy$createFleet()


######################
## Environment Data ##
######################

# Locate the example environment asset' file
envAssetPath <- system.file("extdata/mapAsset.RDS", package = "smartR")

# Load environment asset' data
yourSmartRstudy$importEnv(readRDS(envAssetPath))

# Setup case study' map
yourSmartRstudy$sampMap$getGooMap()
yourSmartRstudy$sampMap$setGooGrid()
yourSmartRstudy$sampMap$setGooBbox()
yourSmartRstudy$sampMap$setGgDepth()
yourSmartRstudy$sampMap$setGgBioDF()
# View case study' grid
print(yourSmartRstudy$sampMap$gooGrid)


################
## Fleet Data ##
################

# Locate the example fleet asset' file
effAssetPath <- system.file("extdata/effAsset.RDS", package = "smartR")

# Load fleet asset' data
yourSmartRstudy$fleet$rawEffort <- readRDS(effAssetPath)

# Setup fishing vessel ids
yourSmartRstudy$fleet$setEffortIds()

# View speed distribution to setup fishing point filter
yourSmartRstudy$fleet$plotSpeedDepth(
which_year = "2012",
speed_range = c(2, 8),
depth_range = c(-20, -600)
)

# Setup fishing points' filter
yourSmartRstudy$fleet$setFishPoinPara(
speed_range = c(2, 8),
depth_range = c(-20, -600)
)

# Compute fishing points
yourSmartRstudy$fleet$setFishPoin()

# Assign cell id to each fishing point
yourSmartRstudy$setCellPoin()

# Add week and month number to each point
yourSmartRstudy$fleet$setWeekMonthNum()


#####################
## Fishing Grounds ##
#####################

# Setup available data to identify fishing areas
yourSmartRstudy$setAvailData()

# Setup cluster analysis input
yourSmartRstudy$sampMap$setClusInpu()

# Run cluster analysis with the SKATER method
yourSmartRstudy$sampMap$calcFishGrou(numCuts = 3, minsize = 10,
 modeska = "S", skater_method = "manhattan", nei_queen = FALSE)

# Setup cluster plot with 3 clusters
yourSmartRstudy$sampMap$setCutResult(ind_clu = 3)

# Map of the clusters' configuration
print(yourSmartRstudy$sampMap$ggCutFGmap)




