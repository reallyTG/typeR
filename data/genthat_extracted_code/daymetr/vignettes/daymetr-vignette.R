## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# load the library
library(daymetr)
library(ncdf4)
library(raster)
library(sp)

# load tile outlines
tile_outlines


## ----eval = TRUE---------------------------------------------------------
df <- download_daymet(site = "Oak Ridge National Laboratories",
                lat = 36.0133,
                lon = -84.2625,
                start = 2000,
                end = 2010,
                internal = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  # code is not run
#  download_daymet_batch(file_location = 'my_sites.csv',
#                        start = 1980,
#                        end = 2010,
#                        internal = TRUE)

## ----eval = TRUE---------------------------------------------------------
str(df)

## ----fig.width = 7, fig.height=3-----------------------------------------
# simple graph of Daymet data
par(mar=c(4,4,1,1))
plot(as.Date(paste(df$data$year,
                   df$data$yday,
                   sep = "-"),
             "%Y-%j"),
     df$data$tmax..deg.c.,
     xlab = "Date",
     ylab = expression("max. temperature (" * degree * "C)"),
     type = "l",
     col = "lightblue")

## ----eval = FALSE--------------------------------------------------------
#  # code not run
#  df$data <- df$data %>%
#    mutate(tmean = (tmax..deg.c. + tmin..deg.c.)/2,
#           date = as.Date(paste(year, yday, sep = "-"), "%Y-%j"))

## ---- fig.width = 7, fig.height = 7--------------------------------------
# plot the tile outlines
# roughly painting a picture of North America
plot(tile_outlines)

## ----eval = FALSE--------------------------------------------------------
#  # code not run
#  
#  # Download tiled data for multiple years (1980 - 2012)
#  # based upon a geographic location.
#  download_daymet_tiles(location = c(36.0133,-84.2625),
#                        tiles = NULL,
#                        start = 1980,
#                        end = 2012,
#                        param = "ALL")
#  
#  # Download tiled data for multiple years (1980 - 2012)
#  # based upon a tile number (11207) restricted to the
#  # minimum temperature data only.
#  download_daymet_tiles(tiles = 11207,
#                        start = 1980,
#                        end = 2012,
#                        param = "tmin")
#  

## ---- fig.width = 7, fig.height = 7--------------------------------------
# download monthly
download_daymet_ncss(location = c(34, -82, 33.75, -81.75),
                     start = 1980,
                     end = 1980,
                     frequency = "monthly",
                     param = c("tmin","tmax"),
                     path = tempdir(),
                     silent = TRUE)

# read in the downloaded data
r = raster::stack(paste0(tempdir(),"/tmin_monavg_1980_ncss.nc"))

# plot the monthly mean minimum temperature for 1980
plot(r)

## ---- fig.width = 7, fig.height = 7--------------------------------------

# plot the monthly mean minimum temperature for 1980
r_tmean = daymet_grid_tmean(path = tempdir(),
                            product = "monavg",
                            year = 1980,
                            internal = TRUE)

# plot the mean temperature raster
plot(r_tmean)

