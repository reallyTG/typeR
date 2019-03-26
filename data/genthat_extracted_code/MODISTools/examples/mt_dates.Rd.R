library(MODISTools)


### Name: mt_dates
### Title: Download all available dates
### Aliases: mt_dates
### Keywords: Land MODIS Products Subsets, meta-data products,

### ** Examples


## No test: 
# list all available MODIS Land Products Subsets products
bands <- mt_dates(product = "MOD11A2", lat = 40, lon = -110)
print(bands)
## End(No test)



