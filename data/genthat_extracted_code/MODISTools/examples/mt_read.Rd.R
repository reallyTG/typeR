library(MODISTools)


### Name: mt_read
### Title: Read a MODISTools data file
### Aliases: mt_read
### Keywords: IO series, time

### ** Examples


## No test: 
# download data
mt_subset(product = "MOD11A2",
           lat = 40,
           lon = -110,
           band = "LST_Day_1km",
           start = "2004-01-01",
           end = "2004-03-31",
           internal = FALSE)

# read file
df <- mt_read(paste0(tempdir(),
               "/sitename_MOD11A2_2004-01-01_2004-03-31.csv"))
print(df)
## End(No test)



