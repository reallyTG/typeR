library(phenocamr)


### Name: truncate_phenocam
### Title: Truncate a PhenoCam time series
### Aliases: truncate_phenocam
### Keywords: phenocam series, smoothing, time

### ** Examples


## No test: 
# download demo data
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")
                  
# overwrites the original file, increasing
# decreasing the file size, with given year as maximum.
truncate_phenocam(file.paste(tempdir(),"harvard_DB_1000_3day.csv"),
                  year = 2015)
## End(No test)



