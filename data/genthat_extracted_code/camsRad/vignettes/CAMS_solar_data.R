## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>", 
  collapse = TRUE,
  warning = FALSE
)
if(Sys.getenv("CAMS_USERNAME")=="") {
  knitr::opts_chunk$set(eval = FALSE) # doesn't build vignette if CAMS_USERNAME is not set
}

## ----eval=FALSE----------------------------------------------------------
#  # Authentication
#  cams_set_user("your@email.com") # An email registered at soda-pro.com

## ------------------------------------------------------------------------
#  library(camsRad)
#  
#  df <- cams_get_radiation(
#    lat=60, lng=15, # Latitude & longitude coordinates
#    date_begin="2016-07-01", date_end="2016-07-01", # Date range
#    time_step="PT01H") # Use hourly time step
#  

## ------------------------------------------------------------------------
#  print(df)

## ---- warning = FALSE, fig.width=7---------------------------------------
#  library(ncdf4)
#  
#  filename <- paste0(tempfile(), ".nc")
#  
#  r <- cams_api(
#    60, 15, "2016-06-01", "2016-07-1", # Latitude/longitude and date range
#    format="application/x-netcdf", # specifies output format as netCDF
#    time_step = "P01D", # daily sum is specified
#    filename=filename)
#  
#  # Access the on disk stored netCDF file
#  nc <- nc_open(r$response$content)
#  
#  # List names of available variables
#  names(nc$var)
#  
#  # Create data.frame with datetime and global horizontal irradiation
#  df <- data.frame(
#    timestamp = as.POSIXct(nc$dim$time$vals, "UTC", origin="1970-01-01"),
#    GHI = ncvar_get(nc, "GHI"))
#  df$timestamp <- df$timestamp-3600*24 # shift timestamp 24 hours backwards
#  
#  nc_close(nc) # close connection
#  
#  # And plot it
#  par(mar=c(4.5,4,0.8,1))
#  plot(df, type="b", ylab="GHI, Wh/m2,day", xlab="2016")
#  
#  

