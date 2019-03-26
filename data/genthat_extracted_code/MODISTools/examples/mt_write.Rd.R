library(MODISTools)


### Name: mt_write
### Title: Write a MODISTools data structure to file
### Aliases: mt_write
### Keywords: IO series, time

### ** Examples


## No test: 
# download data
subset <- mt_subset(product = "MOD11A2",
                        lat = 40,
                        lon = -110,
                        band = "LST_Day_1km",
                        start = "2004-01-01",
                        end = "2004-02-01")
# write the above file to disk
mt_write(df = subset,
             out_dir = tempdir())

# read the data back in
subset_disk <- mt_read(paste0(tempdir(),
               "/sitename_MOD11A2_2004-01-01_2004-02-01.csv"))

# compare original to read from disk
identical(subset, subset_disk)
## End(No test)



