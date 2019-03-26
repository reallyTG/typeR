library(phenocamr)


### Name: read_phenocam
### Title: Read PhenoCam time series data
### Aliases: read_phenocam
### Keywords: phenocam series, smoothing, time

### ** Examples


## No test: 
# download demo data (do not smooth)
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3",
                  smooth = FALSE)

# read the phenocamo data file
df = read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

# print data structure
print(summary(df))

# write the phenocamo data file
write_phenocam(df, out_dir = tempdir())
## End(No test)



