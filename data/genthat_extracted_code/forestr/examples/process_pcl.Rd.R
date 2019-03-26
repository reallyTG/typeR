library(forestr)


### Name: process_pcl
### Title: Process single PCL transects.
### Aliases: process_pcl
### Keywords: pcl processing

### ** Examples

# Link to stored, raw PCL data in .csv form
uva.pcl <- system.file("extdata", "UVAX_A4_01W.csv", package = "forestr")

# Run process complete PCL transect, store output to disk
process_pcl(uva.pcl, marker.spacing = 10, user_height = 1.05,
max.vai = 8, pavd = FALSE, hist = FALSE)


# with data frame
process_pcl(osbs, marker.spacing = 10, user_height = 1.05,
max.vai = 8, pavd = FALSE, hist = FALSE)





