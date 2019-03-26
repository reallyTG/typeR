library(RchivalTag)


### Name: read_PDT
### Title: read PDT data from archival one or multiple tags
### Aliases: read_PDT

### ** Examples

## step I) read sample PDT data file:
path <- system.file("example_files",package="RchivalTag")
PDT <- read_PDT("104659-PDTs.csv",folder=path)
head(PDT)

## step II) interpolate average temperature fields (MeanPDT) from PDT file:
# m <- interpolate_PDTs(PDT)
# str(m)
# m$sm

## step III) calculate thermal stratifcation indicators per day (and tag):
# strat <- get_thermalstrat(m, all_info = TRUE)
# strat <- get_thermalstrat(m, all_info = FALSE)

## step IV) plot interpolated profiles:
# image_TempDepthProfiles(m$station.1)





