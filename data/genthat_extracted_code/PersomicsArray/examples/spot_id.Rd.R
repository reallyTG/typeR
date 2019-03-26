library(PersomicsArray)


### Name: spot_id
### Title: spot_id
### Aliases: spot_id

### ** Examples

# get names of all plate image files in current working directory
tif.files <- list.files(path = getwd(), pattern = ".tif", all.files = FALSE,
                    full.names = FALSE, recursive = FALSE, ignore.case = TRUE,
                    include.dirs = FALSE)

# read images, process, and extract individual image files for each array position
spot_id(files=tif.files,ann="annotation.csv",channel.num=3, spot.channel=1,
smooth.cycle=4, binary.cut= 0.3, channel.scaling=TRUE, scale.percentiles=c(0.01,0.99))




