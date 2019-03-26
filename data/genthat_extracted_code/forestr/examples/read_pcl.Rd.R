library(forestr)


### Name: read_pcl
### Title: 'read_pcl' imports PCL or portable canopy LiDAR files into the
###   workspace and formats them.
### Aliases: read_pcl
### Keywords: data input pcl raw read

### ** Examples


# Link to raw PCL data, in .csv form.
uva_pcl <- system.file("extdata", "UVAX_A4_01W.csv", package = "forestr")

# Import PCL data to the workspace
pcl_data <-read_pcl(uva_pcl)





