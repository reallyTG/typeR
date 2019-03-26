library(phenocamr)


### Name: transition_dates
### Title: Calculates transition dates for a PhenoCam time series
### Aliases: transition_dates
### Keywords: PhenoCam, dates, phenology, series time transition

### ** Examples


## No test: 
# download demo data
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")

# read the data and calculate transition dates
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
my_dates <- transition_dates(df,
                            lower_thresh = 0.1,
                            middle_thresh = 0.25,
                            upper_thresh = 0.5,
                            percentile = 90,
                            reverse = FALSE,
                            plot = FALSE)
## End(No test)



