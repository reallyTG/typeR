library(phenocamr)


### Name: contract_phenocam
### Title: Contracts the file from 1-day to a 3-day time step
### Aliases: contract_phenocam
### Keywords: phenocam, post-processing series, time

### ** Examples


## No test: 
# download demo data
download_phenocam(site = "harvard$",
                  veg_type = "DB",
                  roi_id = "1000",
                  frequency = "3")

# Overwrites the original file, increasing
# it's file size.
expand_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

# Contracts the file to it's original size, skipping
# two days.
contract_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))
## End(No test)



