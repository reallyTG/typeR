library(phenocamr)


### Name: grvi
### Title: Calculate green-red vegetation index (GRVI)
### Aliases: grvi
### Keywords: colour index, phenocam series, time

### ** Examples


## No test: 
# with defaults, outputting a data frame
# with smoothed values, overwriting the original

# download demo data
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")

# calculate and append the GRVI for a file (overwrites the original)
grvi(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

# as all functions this also works on a PhenoCam data structure
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
df <- grvi(df, par = c(1, 1, 0))
## End(No test)



