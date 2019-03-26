library(phenocamr)


### Name: download_phenocam
### Title: Function to download and post-process PhenoCam time series
### Aliases: download_phenocam
### Keywords: Daymet, PhenoCam, climate data, modelling, post-processing

### ** Examples


## No test: 
# download the first ROI time series for the Harvard PhenoCam site
# at an aggregation frequency of 3-days.
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")
 
# read phenocam data into phenocamr data structure                  
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
                  
## End(No test)



