## ----eval = FALSE, message = FALSE, warning = FALSE----------------------
#  library(ncdf4)
#  library(ncdf4.helpers)
#  library(PCICt)

## ----message = FALSE, warning = FALSE, eval = FALSE----------------------
#  library(readr)
#  library(dplyr)
#  library(tidyr)
#  library(ggplot2)

## ----eval = FALSE--------------------------------------------------------
#  climate_filepath <- paste0("~/tmp/tas_day_GFDL-ESM2G_rcp85",
#                              "_r1i1p1_20710101-20751231.nc")
#  climate_output <- nc_open(climate_filepath)

## ----eval = FALSE--------------------------------------------------------
#  climate_output

## ----eval = FALSE--------------------------------------------------------
#  lon <- ncvar_get(climate_output, varid = "lon")
#  lat <- ncvar_get(climate_output, varid = "lat")
#  
#  summary(lon)

## ----eval = FALSE--------------------------------------------------------
#  summary(lat)

## ----eval = FALSE--------------------------------------------------------
#  climate_output$dim$time$units

## ----eval = FALSE--------------------------------------------------------
#  climate_output$dim$time$calendar

## ----eval = FALSE--------------------------------------------------------
#  tas_time <- nc.get.time.series(climate_output, v = "tas",
#                                 time.dim.name = "time")
#  tas_time[c(1:3, length(tas_time) - 2:0)]

## ----eval = FALSE--------------------------------------------------------
#  tas <- ncvar_get(climate_output, "tas")

## ----eval = FALSE--------------------------------------------------------
#  dim(tas)

## ----eval = FALSE--------------------------------------------------------
#  length(lon)

## ----eval = FALSE--------------------------------------------------------
#  length(lat)

## ----eval = FALSE--------------------------------------------------------
#  length(tas_time)

## ----eval = FALSE--------------------------------------------------------
#  lon_index <- which.min(abs(lon - 116.4))
#  lat_index <- which.min(abs(lat - 39.9))
#  time_index <- which(format(tas_time, "%Y-%m-%d") == "2075-07-15")
#  tas[lon_index, lat_index, time_index]

## ----eval = FALSE, fig.width = 6, fig.height = 3, echo = 2:15------------
#  png("figures/beijing_timeseries.png", height = 300, width = 600)
#  lon_index <- which.min(abs(lon - 116.4))
#  lat_index <- which.min(abs(lat - 39.9))
#  tas <- nc.get.var.subset.by.axes(climate_output, "tas",
#                                   axis.indices = list(X = lon_index,
#                                                       Y = lat_index))
#  data_frame(time = tas_time,
#             tas = as.vector(tas)) %>%
#          mutate(time = as.Date(format(time, "%Y-%m-%d"))) %>%
#          ggplot(aes(x = time, y = tas)) +
#          geom_line() +
#          xlab("Date") + ylab("Temperature (K)") +
#          ggtitle("Daily modeled near-surface air temprature, 2071-2075",
#                  subtitle = "At model grid point nearest Beijing, China") +
#          theme_classic()
#  dev.off()

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("figures/beijing_timeseries.png")

## ----eval = FALSE--------------------------------------------------------
#  july_15_2075 <- nc.get.var.subset.by.axes(climate_output, "tas",
#                                            axis.indices = list(T = time_index))
#  july_15_2075[1:3, 1:3, ]

## ----eval = FALSE, fig.width = 8, fig.height = 4, message = FALSE, warning = FALSE, echo = 2:21----
#  png("figures/worldmap.png", height = 400, width = 800)
#  library(ggmap)
#  library(viridis)
#  library(weathermetrics)
#  time_index <- which(format(tas_time, "%Y-%m-%d") == "2075-07-15")
#  tas <- nc.get.var.subset.by.axes(climate_output, "tas",
#                                   axis.indices = list(T = time_index))
#  expand.grid(lon, lat) %>%
#          rename(lon = Var1, lat = Var2) %>%
#          mutate(lon = ifelse(lon > 180, -(360 - lon), lon),
#                 tas = as.vector(tas)) %>%
#          mutate(tas = convert_temperature(tas, "k", "c")) %>%
#          ggplot() +
#          geom_point(aes(x = lon, y = lat, color = tas),
#                     size = 0.8) +
#          borders("world", colour="black", fill=NA) +
#          scale_color_viridis(name = "Temperature (C)") +
#          theme_void() +
#          coord_quickmap() +
#          ggtitle("Modeled temperature on a day in July 2075",
#                  subtitle = "GFDL-ESM2G model, RCP8.5 experiment, r1i1p1 ensemble member")
#  dev.off()

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("figures/worldmap.png")

## ----eval = FALSE--------------------------------------------------------
#  nc_close(climate_output)

## ----eval = FALSE--------------------------------------------------------
#  library(RCMIP5)
#  getFileInfo("~/tmp")

## ----message = FALSE, warning = FALSE, eval = FALSE----------------------
#  # Load required libraries
#  library(ncdf4)
#  library(ncdf4.helpers)
#  library(PCICt)
#  library(readr)
#  library(dplyr)
#  library(tidyr)
#  
#  #' Function to process CMIP5 netCDF files to format required by
#  #'    `futureheatwaves` package
#  #'
#  #' filepath: A character vector giving the path to the netCDF
#  #'    climate model output file
#  #' output_dir: A character vector giving the path to the directory
#  #'    where output should be saved
#  #' var: The climate model variable ("tas" is near-surface air temperature)
#  #' append: Logical specifying whether results should be appended to
#  #'     existing files in the output directory
#  #' lon_range: If not NULL, a length two numerical vector giving the range
#  #'    of longitudes to be saved. Values should be in degrees east in the
#  #'    0 to 360 degree range.
#  #' lat_range: If not NULL, a length two numerical vector giving the range
#  #'    of latitudes to be saved. Values should be in degrees north in the
#  #     -90 to 90 range.
#  process_cmip5_file <- function(filepath, output_dir,
#                                 var = "tas",
#                                 append = FALSE,
#                                 lon_range = NULL,
#                                 lat_range = NULL){
#          # Open netCDF connection, read in dimensions and climate variable
#          climate_output <- ncdf4::nc_open(filepath)
#          lon <- ncdf4::ncvar_get(climate_output, "lon")
#          lat <- ncdf4::ncvar_get(climate_output, "lat")
#          tas_time <- ncdf4.helpers::nc.get.time.series(climate_output,
#                                                        v = var,
#                                                        time.dim.name = "time")
#          tas <- ncdf4::ncvar_get(climate_output, var)
#          ncdf4::nc_close(climate_output)
#  
#          # Print out converted time and filepath name to ensure that
#          # time was converted correctly based on calendar
#          cat(paste("First and last two dates processed for file named\n",
#                    filepath, "are:\n"))
#          print(format(tas_time[c(1:2, length(tas_time) - 1:0)],
#                       "%Y-%m-%d"))
#  
#          # If requested, limit to certain ranges of latitude and/or longitude
#          if(!is.null(lon_range)){
#                  lon_range <- sort(lon_range)
#                  lon_index <- which(lon_range[1] <= lon &
#                                             lon <= lon_range[2])
#                  lon <- lon[lon_index]
#                  tas <- tas[lon_index, , ]
#          }
#          if(!is.null(lat_range)){
#                  lat_range <- sort(lat_range)
#                  lat_index <- which(lat_range[1] <= lat &
#                                             lat <= lat_range[2])
#                  lat <- lat[lat_index]
#                  tas <- tas[ , lat_index, ]
#          }
#  
#          # Change to appropriate format for futureheatwaves package
#          time_output <- dplyr::data_frame(index = 1:length(tas_time),
#                                           time = format(tas_time,
#                                                         "%Y-%m-%d")) %>%
#                  tidyr::separate(time, c("year", "month", "day")) %>%
#                  dplyr::mutate(year = as.integer(year),
#                                month = as.integer(month),
#                                day = as.integer(day))
#          coordinate_output <- expand.grid(lon, lat) %>%
#                  dplyr::rename("lon" = Var1) %>%
#                  dplyr::rename("lat" = Var2) %>%
#                  dplyr::select(lat, lon)
#          tas_output <- matrix(unlist(tas),
#                               ncol = length(lon) * length(lat),
#                               byrow = TRUE) %>%
#                  as.data.frame()
#  
#          # Write out to files
#          if(!append & !dir.exists(output_dir)){
#                  dir.create(output_dir, recursive = TRUE)
#          }
#          readr::write_csv(time_output,
#                           path = paste0(output_dir, "/time_day.csv"),
#                           col_names = FALSE, append = append)
#          if(!append){
#                  readr::write_csv(coordinate_output,
#                           path = paste0(output_dir,
#                                         "/latitude_longitude_day.csv"),
#                           col_names = FALSE)
#          }
#          readr::write_csv(tas_output,
#                           path = paste0(output_dir, "/tas_day.csv"),
#                           col_names = FALSE, append = append)
#  
#          return(NULL)
#  }

## ----results = "hold", eval = FALSE--------------------------------------
#  # Process two historical files for the GFDL-ESM2G model's r1i1p1
#  # ensemble, historical experiment
#  process_cmip5_file(filepath = paste0("~/tmp/tas_day_GFDL-ESM2G_",
#                                        "historical_r1i1p1_19860101-",
#                                        "19901231.nc"),
#                      output_dir = "~/tmp/dataFolder/historical/GFDL/r1i1p1",
#                      lon_range = c(70, 140),
#                      lat_range = c(15, 60))
#  process_cmip5_file(filepath = paste0("~/tmp/tas_day_GFDL-ESM2G_",
#                                        "historical_r1i1p1_19910101-",
#                                        "19951231.nc"),
#                      output_dir = "~/tmp/dataFolder/historical/GFDL/r1i1p1",
#                      lon_range = c(70, 140),
#                      lat_range = c(15, 60),
#                      append = TRUE)

## ----results = "hold", eval = FALSE--------------------------------------
#  # Process two scenario files for the GFDL-ESM2G model's r1i1p1
#  # ensemble, RCP8.5 experiment
#  process_cmip5_file(filepath = paste0("~/tmp/tas_day_GFDL-ESM2G_",
#                                       "rcp85_r1i1p1_20710101-20751231.nc"),
#                      output_dir = "~/tmp/dataFolder/rcp85/GFDL/r1i1p1",
#                      lon_range = c(70, 140),
#                      lat_range = c(15, 60))
#  process_cmip5_file(filepath = paste0("~/tmp/tas_day_GFDL-ESM2G_",
#                                       "rcp85_r1i1p1_20760101-20801231.nc"),
#                      output_dir = "~/tmp/dataFolder/rcp85/GFDL/r1i1p1",
#                      lon_range = c(70, 140),
#                      lat_range = c(15, 60),
#                      append = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  library(futureheatwaves)
#  city_file_location <- system.file("extdata/chinese_cities.csv",
#                                   package = "futureheatwaves")
#  gen_hw_set(out = "~/tmp/example_results",
#             dataFolder = "~/tmp/dataFolder",
#             dataDirectories = list("historical" = c(1986, 1995),
#                                    "rcp85" = c(2071, 2080)),
#             citycsv = city_file_location,
#             coordinateFilenames = "latitude_longitude_day.csv",
#             tasFilenames = "tas_day.csv",
#             timeFilenames = "time_day.csv",
#             thresholdBoundaries = c(1986, 1995),
#             projectionBoundaries = c(2071, 2080),
#             referenceBoundaries = c(1986, 1995),
#             printWarning = FALSE)

## ----eval = FALSE, message = FALSE, fig.width = 6, fig.height = 6, echo = c(1, 3)----
#  out <- "~/tmp/example_results"
#  png("figures/map_ggmap.png", height = 500, width = 500)
#  map_grid_ggmap(plot_model = "GFDL", out = out)
#  dev.off()

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("figures/map_ggmap.png")

## ----eval = FALSE, message = FALSE, echo = c(1:2, 4:12)------------------
#  library(forcats)
#  library(ggplot2)
#  png("figures/number_of_heatwaves.png", height = 400, width = 350)
#  apply_all_models(out = out, FUN = number_of_heatwaves,
#                   city_specific = TRUE) %>%
#          mutate(city = fct_reorder(city, value)) %>%
#          ggplot(aes(x = city, y = value)) +
#          geom_bar(stat = "identity") +
#          coord_flip() +
#          theme_classic() +
#          ylab("# of heatwaves") +
#          xlab("")
#  dev.off()

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("figures/number_of_heatwaves.png")

## ----eval = FALSE, fig.height = 4, fig.width = 4, echo = c(2:10)---------
#  png("figures/average_heatwave_temp.png", height = 300, width = 300)
#  apply_all_models(out = out, FUN = average_mean_temp,
#                   city_specific = TRUE) %>%
#          mutate(value = convert_temperature(value, "k", "c")) %>%
#          mutate(city = fct_reorder(city, value)) %>%
#          ggplot(aes(x = value, y = city)) +
#          geom_point() +
#          ylab("") +
#          xlab(expression(paste("Average temperature during heatwaves (",
#                                degree*C, ")")))
#  dev.off()

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("figures/average_heatwave_temp.png")

