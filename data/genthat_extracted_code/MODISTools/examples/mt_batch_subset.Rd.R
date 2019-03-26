library(MODISTools)


### Name: mt_batch_subset
### Title: Batch download MODIS Land Products subsets
### Aliases: mt_batch_subset
### Keywords: Land MODIS Products Subsets, meta-data products,

### ** Examples


## No test: 
# create data frame with a site_name, lat and lon column
# holding the respective names of sites and their location
df <- data.frame("site_name" = paste("test",1:2))
df$lat <- 40
df$lon <- -110

print(df)

# test batch download
subsets <- mt_batch_subset(df = df,
                        product = "MOD11A2",
                        band = "LST_Day_1km",
                        internal = TRUE,
                        start = "2004-01-01",
                        end = "2004-03-31",
                        out_dir = "~")

print(str(subsets))

## End(No test)



