## ---- include=FALSE, warning=FALSE, message=FALSE------------------------
library(httptest)

start_vignette("getting_started")

## ----find_station, message=FALSE, warning=FALSE--------------------------
library(noaaoceans)
library(dplyr)
library(ggplot2)
library(maps)
library(mapdata)

# Get a list of all the stations.
station_df <- list_coops_stations()

# Inspect our data frame
station_df %>% dim()
station_df %>% dplyr::as_tibble(.) %>% head()

## ----wa_stations---------------------------------------------------------
# Filter to stations in Washington with Water Temp Sensor
wa_station <- station_df %>% 
    filter(station_state == 'WA' & water_temp == '1')

## ----query_api-----------------------------------------------------------
# Create an empty storage data frame. 
water_temp <- data.frame()

# Loop through the station and call the API for each station
for (i in wa_station$station_id) {
    query_df <- query_coops_data(station_id = i,
                                 start_date = '20181201',
                                 end_date = '20181231',
                                 data_product = 'water_temperature',
                                 interval = 'h') # hourly readings
    
    # Add current station results to the storage data frame 
    water_temp <- water_temp %>% bind_rows(., query_df)
}

## ----inspect_data--------------------------------------------------------
dim(water_temp)
names(water_temp)
water_temp %>% head()

## ----plot_data, fig.height=5, fig.width=7--------------------------------
# Correct data types. 
water_temp <- water_temp %>% 
    mutate(v = as.numeric(v), t = as.POSIXct(t))

water_temp %>% 
    group_by(t) %>% 
    # Compute the hourly average. 
    summarise(avg_temp = mean(v, na.rm = TRUE)) %>% 
    # Plot the hourly average. 
    ggplot(aes(x = t, y = avg_temp)) +
    geom_path() +
    labs(x = "Date",
         y = 'Average Water Temperature',
         title = 'Average Hourly Water Temperature In Washington During December 2018')

## ----prepare_map_data----------------------------------------------------
# Compute the average temperature by location. 
station_average <- water_temp %>% 
    group_by(station) %>% 
    summarise(avg_temp = mean(v, na.rm = TRUE)) 

# Join the station metadata so we have the location of each station.    
station_average <- station_average %>% 
    inner_join(., wa_station, by = c('station' = 'station_id')) %>% 
    # Convert the station corrdinates to numeric data type to work with plot
    mutate(station_long = as.numeric(station_long),
           station_lat = as.numeric(station_lat))

# Inspect our data frame before plotting
station_average %>% dim()
station_average %>% as_tibble(.) %>% head()

## ----make_map, fig.height=4, fig.width=6---------------------------------
# Get a map for Washington state.
wa_map <- ggplot2::map_data('state') %>% 
    filter(region == 'washington')

ggplot(data = wa_map) + 
  # Plot the map
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               fill = "gray",
               color = "black") + 
  # Add the stations & use color for the average temp. 
  geom_point(aes(x = station_long,
                 y = station_lat,
                 color = avg_temp),
             data = station_average) + 
  labs(x = 'Longitude',
         y = 'Latitude',
         title = 'Average Water Temperature by Station') + 
  scale_color_continuous(name ="Average Water\n Temperature")

## ----known_issue, error = TRUE-------------------------------------------
neah_bay_january <- query_coops_data(station_id = '9443090',
                                     start_date = '20180101',
                                     end_date = '20180228',
                                     data_product = 'water_temperature',
                                     interval = 'h')


## ----known_issue2--------------------------------------------------------
neah_bay_year <- query_coops_data(station_id = '9443090',
                                     start_date = '20180101',
                                     end_date = '20181231',
                                     data_product = 'water_temperature',
                                     interval = 'h')

neah_bay_year %>% head()



## ---- include=FALSE------------------------------------------------------
end_vignette()

