## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  eval = FALSE
)

## ------------------------------------------------------------------------
#  packs <- c('httr', 'xml2', 'lubridate', 'tibble', 'dplyr', 'sp', 'devtools',
#             'leaflet', 'zoo', 'testthat', 'knitr', 'Rmarkdown')
#  new.packages <- packs[!(packs %in% installed.packages()[,'Package'])]
#  if(length(new.packages)) install.packages(new.packages)

## ------------------------------------------------------------------------
#  install.packages('rdefra')

## ------------------------------------------------------------------------
#  devtools::install_github('ropensci/rdefra')

## ---- eval = TRUE--------------------------------------------------------
library('rdefra')

## ---- eval = TRUE--------------------------------------------------------
# Get full catalogue
stations_raw <- ukair_catalogue()

## ---- eval = TRUE--------------------------------------------------------
stations_EnglandOzone <- ukair_catalogue(pollutant = 1, country_id = 1)

## ------------------------------------------------------------------------
#  # Scrape DEFRA website to get Easting/Northing
#  stations <- ukair_get_coordinates(stations_raw)

## ------------------------------------------------------------------------
#  stations$SiteID <- ukair_get_site_id(stations$UK.AIR.ID)

## ---- eval = TRUE--------------------------------------------------------
# Get 1 year of hourly ozone data from London Marylebone Road monitoring station
df <- ukair_get_hourly_data('MY1', years=2015)

# Aggregate to daily means and plot
library('zoo')
my1 <- zoo(x = df$Ozone, order.by = as.POSIXlt(df$datetime))

## ----hourlydata----------------------------------------------------------
#  par(mai = c(0.5, 1, 0, 0))
#  
#  plot(aggregate(my1, as.Date(as.POSIXlt(df$datetime)), mean),
#       main = '', xlab = '', ylab = expression(paste('Ozone concentration [',
#                                                      mu, 'g/', m^3, ']')))

## ----ozone---------------------------------------------------------------
#  # Get 15 years of hourly ozone data from the same monitoring station
#  library('ggplot2')
#  library('dplyr')
#  library('lubridate')
#  
#  df <- ukair_get_hourly_data('MY1', years = 2000:2015)
#  df <- mutate(df,
#               year = year(datetime),
#               month = month(datetime),
#               year_month = strftime(datetime, "%Y-%m"))
#  
#  df %>%
#    group_by(month, year_month) %>%
#    summarize(ozone = mean(Ozone, na.rm=TRUE)) %>%
#    ggplot() +
#    geom_boxplot(aes(x = as.factor(month), y = ozone, group = month),
#                 outlier.shape = NA) +
#    xlab("Month of the year") +
#    ylab(expression(paste("Ozone concentration (", mu, "g/",m^3,")")))

## ---- eval = TRUE--------------------------------------------------------
data('stations')

stations

## ----map-----------------------------------------------------------------
#  stations_with_Hdata <- which(!is.na(stations$SiteID))
#  
#  library('leaflet')
#  leaflet(data = stations) %>% addTiles() %>%
#    addCircleMarkers(lng = ~Longitude[stations_with_Hdata],
#                     lat = ~Latitude[stations_with_Hdata],
#                     radius = 0.5, color='red',
#                     popup = ~SiteID[stations_with_Hdata]) %>%
#    addCircleMarkers(lng = ~Longitude,
#                     lat = ~Latitude,
#                     popup = ~SiteID,
#                     radius = 1, color='blue', fill = FALSE)
#  

## ----dotchart1-----------------------------------------------------------
#  # Zone
#  dotchart(as.matrix(table(stations$Zone))[,1])

## ----dotchart2-----------------------------------------------------------
#  # Environment.Type
#  dotchart(as.matrix(table(stations$Environment.Type[stations$Environment.Type != 'Unknown Unknown']))[,1])

## ------------------------------------------------------------------------
#  library('parallel')
#  
#  # Use detectCores() to find out many cores are available on your machine
#  cl <- makeCluster(getOption("cl.cores", detectCores()))
#  
#  system.time(myList <- parLapply(cl, stations$SiteID[stations_with_Hdata],
#                                  ukair_get_hourly_data, years=1999:2016))
#  
#  stopCluster(cl)
#  
#  df <- bind_rows(myList)

