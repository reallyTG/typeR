library(wux)


### Name: AverageWuxDataFrame
### Title: WUX data frame averaging function
### Aliases: AverageWuxDataFrame
### Keywords: IO iteration datagen univar manip

### ** Examples

## load WUX and read WUX test data
require(wux)
data(cmip3_2050)

## average over runs
cmip3.avg.runs <- AverageWuxDataFrame(cmip3_2050, "gcm.run")
## average over seasons, runs and subregions
cmip3.avg.all <- AverageWuxDataFrame(cmip3_2050, INDEX = c("gcm.run", "subreg", "season"))





