## ----global_options, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 8, fig.height = 3, fig.align = 'centre',
                      echo = TRUE, warning = FALSE, message = FALSE,
                      eval = FALSE, tidy = FALSE)

## ----setup, eval=FALSE---------------------------------------------------
#  # The three packages we will need
#  library(dplyr)
#  library(rerddap)
#  library(ncdf4)
#  
#  # The information for the NOAA OISST data
#  info(datasetid = "ncdc_oisst_v2_avhrr_by_time_zlev_lat_lon", url = "https://www.ncei.noaa.gov/erddap/")

## ----download-func-------------------------------------------------------
#  # This function expects the user to provide it with two values
#  # that match the time format of the target OISST dataset
#  OISST_sub <- function(times){
#    oisst_res <- griddap(x = "ncdc_oisst_v2_avhrr_by_time_zlev_lat_lon",
#                         url = "https://www.ncei.noaa.gov/erddap/",
#                          time = times,
#                          depth = c(0, 0),
#                          latitude = c(-40, -35),
#                          longitude = c(15, 21),
#                          fields = "sst")
#  }

## ----download-data-------------------------------------------------------
#  OISST1 <- OISST_sub(c("1981-09-01T00:00:00Z", "1990-12-31T00:00:00Z"))
#  OISST2 <- OISST_sub(c("1991-01-01T00:00:00Z", "1999-12-31T00:00:00Z"))
#  OISST3 <- OISST_sub(c("2000-01-01T00:00:00Z", "2008-12-31T00:00:00Z"))
#  OISST4 <- OISST_sub(c("2009-01-01T00:00:00Z", "2013-12-03T00:00:00Z"))
#  OISST5 <- OISST_sub(c("2014-01-01T00:00:00Z", "2018-12-03T00:00:00Z"))

## ----prep-func-----------------------------------------------------------
#  OISST_prep <- function(nc_file){
#  
#    # Open the NetCDF connection
#    nc <- nc_open(nc_file$summary$filename)
#  
#    # Extract the SST values and add the lon/lat/time dimension names
#    res <- ncvar_get(nc, varid = "sst")
#    dimnames(res) <- list(lon = nc$dim$longitude$vals,
#                          lat = nc$dim$latitude$vals,
#                          t = nc$dim$time$vals)
#  
#    # Convert the data into a 'long' dataframe for use in the 'tidyverse' ecosystem
#    res <- as.data.frame(reshape2::melt(res, value.name = "temp"), row.names = NULL) %>%
#      mutate(t = as.Date(as.POSIXct(t, origin = "1970-01-01 00:00:00")),
#             temp = round(temp, 2))
#  
#    # Close the NetCDF connection and finish
#    nc_close(nc)
#    return(res)
#  }

## ----prep-data-----------------------------------------------------------
#  # Prep the data
#  OISST1_prep <- OISST_prep(OISST1)
#  OISST2_prep <- OISST_prep(OISST2)
#  OISST3_prep <- OISST_prep(OISST3)
#  OISST4_prep <- OISST_prep(OISST4)
#  OISST5_prep <- OISST_prep(OISST5)
#  
#  # Bind them together
#  OISST_all <- rbind(OISST1_prep, OISST2_prep, OISST3_prep, OISST4_prep, OISST5_prep)
#  
#  # Save the data as an .Rda file
#  saveRDS(OISST_all, file = "~/Desktop/OISST_vignette.Rda")

