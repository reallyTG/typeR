library(phenocamr)


### Name: merge_daymet
### Title: Merge Daymet data with a PhenoCam time series
### Aliases: merge_daymet
### Keywords: Daymet, PhenoCam, data integration series, time

### ** Examples


## No test: 
# download demo data
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")

# merge data with daymet data
merge_daymet(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
## End(No test)



