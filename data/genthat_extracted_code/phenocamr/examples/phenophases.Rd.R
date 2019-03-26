library(phenocamr)


### Name: phenophases
### Title: Calculates phenophases, for rising and falling parts of a time
###   series
### Aliases: phenophases
### Keywords: PhenoCam, dates, phenology, series time transition

### ** Examples


## No test: 
# downloads a time series
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")

# read in data as data frame and calculate phenophases
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
my_dates <- phenophases(df, internal = TRUE)

# print results
print(my_dates)
## End(No test)



