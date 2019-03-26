library(testthat)
library(MazamaSpatialUtils)

# setSpatialDataDir('./SpatialData')
# initializeSpatialData()

# Get current spatialDataDir
userSpatialDataDir <- try(getSpatialDataDir())

test_check("MazamaSpatialUtils")

# Reset spatialDataDir
if (class(userSpatialDataDir) == "character") {
  setSpatialDataDir(userSpatialDataDir)
} else {
  removeSpatialDataDir()
}
