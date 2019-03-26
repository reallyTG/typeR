library(phenocamr)


### Name: smooth_ts
### Title: Smooths a PhenoCam time series
### Aliases: smooth_ts
### Keywords: phenocam series, smoothing, time

### ** Examples


## No test: 
# with defaults, outputting a data frame
# with smoothed values, overwriting the original

# download demo data (do not smooth)
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3",
                  smooth = FALSE)

# smooth the downloaded file (and overwrite the original)
smooth_ts(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

# the function also works on a PhenoCam data frame
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
df <- smooth_ts(df)
## End(No test)



