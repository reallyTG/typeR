## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# load the library
library(MODISTools)


## ----eval = TRUE---------------------------------------------------------
products <- mt_products()
head(products)

## ----eval = TRUE---------------------------------------------------------
bands <- mt_bands(product = "MOD11A2")
head(bands)

## ----eval = TRUE---------------------------------------------------------
dates <- mt_dates(product = "MOD11A2", lat = 42, lon = -110)
head(dates)

## ----eval = TRUE---------------------------------------------------------
# download data
subset <- mt_subset(product = "MOD11A2",
                    lat = 40,
                    lon = -110,
                    band = "LST_Day_1km",
                    start = "2004-01-01",
                    end = "2004-06-01",
                    km_lr = 0,
                    km_ab = 0,
                    site_name = "testsite",
                    internal = TRUE)
head(subset)


## ----fig.width = 7, fig.height=3-----------------------------------------
# create a plot of the data (i.e. daytime land surface temperature, LST)
# the data has a multiplier of 0.02 in order to convert stored values
# you can extract the multiplier (if applicable) from the data header
date <- as.Date(subset$data$calendar_date)
temperature <- subset$data$data * as.double(subset$header$scale)
temperature[temperature == 0] <- NA

plot(date,
     temperature,
     xlab = "Date",
     ylab = expression("LST temperature (" * degree * "K)"))

## ----eval = TRUE---------------------------------------------------------
# create data frame with a site_name, lat and lon column
# holding the respective names of sites and their location
df <- data.frame("site_name" = paste("test",1:2), stringsAsFactors = FALSE)
df$lat <- 40
df$lon <- -110

# an example batch download data frame
print(df)

# test batch download
subsets <- mt_batch_subset(df = df,
                     product = "MOD11A2",
                     band = "LST_Day_1km",
                     internal = TRUE,
                     start = "2004-01-01",
                     end = "2004-02-28",
                     out_dir = "~")

print(str(subsets))

## ----eval = TRUE---------------------------------------------------------
# write the above file to disk
mt_write(df = subset,
             out_dir = tempdir())

# read the data back in
subset_disk <- mt_read(paste0(tempdir(),
                  "/testsite_MOD11A2_2004-01-01_2004-06-01.csv"))

# compare original to read from disk
identical(subset, subset_disk)

