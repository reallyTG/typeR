library(MODISTools)


### Name: mt_subset
### Title: Download MODIS Land Products subsets
### Aliases: mt_subset
### Keywords: Land MODIS Products Subsets, meta-data products,

### ** Examples


## No test: 
# list all available MODIS Land Products Subsets products
# download data
subset <- mt_subset(product = "MOD11A2",
                        lat = 40,
                        lon = -110,
                        band = "LST_Day_1km",
                        start = "2004-01-01",
                        end = "2004-03-31")
 print(str(subset))
## End(No test)



