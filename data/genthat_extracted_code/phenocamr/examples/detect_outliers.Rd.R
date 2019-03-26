library(phenocamr)


### Name: detect_outliers
### Title: Detect outliers in PhenoCam time series
### Aliases: detect_outliers
### Keywords: PhenoCam, outliers, post-processing

### ** Examples


## No test: 
# download demo data (do not detect outliers)
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3",
                  outlier_detection = FALSE)

# detect outliers in the downloaded file
detect_outliers(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

## End(No test)



