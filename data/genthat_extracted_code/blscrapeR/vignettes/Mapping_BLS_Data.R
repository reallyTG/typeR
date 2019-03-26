## ----eval=FALSE----------------------------------------------------------
#  library(blscrapeR)
#  df <- get_bls_county(stateName = "Florida")
#  
#  map_bls(map_data=df, fill_rate = "unemployed_rate",
#                 stateName = "Florida")

## ----eval=FALSE----------------------------------------------------------
#  # Map the unemployment rate for the Southeastern United States.
#  df <- get_bls_county(stateName = c("Florida", "Georgia", "Alabama"))
#  
#  map_bls(map_data=df, fill_rate = "unemployed_rate", projection = "lambert",
#                 stateName = c("Florida", "Georgia", "Alabama"))

## ------------------------------------------------------------------------
library(blscrapeR)
us_map <- county_map_data
head(us_map)

## ----eval=FALSE----------------------------------------------------------
#  library(blscrapeR)
#  library(ggplot2)
#  # Get the most recent unemployment rate for each county on a national level.
#  df <- get_bls_county()
#  # Get map data
#  us_map <- county_map_data
#  
#  # Insert larger breaks in unemployment rates
#  df$rate_d <- cut(df$unemployed_rate, breaks = c(seq(0, 10, by = 2), 35))
#  # Plot
#  ggplot() +
#      geom_map(data=us_map, map=us_map,
#               aes(x=long, y=lat, map_id=id, group=group),
#               fill="#ffffff", color="#0e0e0e", size=0.15) +
#      geom_map(data=df, map=us_map, aes_string(map_id="fips", fill=df$rate_d),
#               color="#0e0e0e", size=0.15) +
#      scale_fill_brewer()+
#      coord_equal() +
#      theme(axis.line=element_blank(),
#            axis.text.x=element_blank(),
#            axis.text.y=element_blank(),
#            axis.ticks=element_blank(),
#            axis.title.x=element_blank(),
#            axis.title.y=element_blank(),
#            panel.grid.major = element_blank(),
#            panel.grid.minor = element_blank(),
#            panel.border = element_blank(),
#            panel.background = element_blank(),
#            legend.title=element_blank())
#  

## ----eval=FALSE----------------------------------------------------------
#  # Leaflet map
#  library(blscrapeR)
#  library(tigris)
#  library(leaflet)
#  map.shape <- counties(cb = TRUE, year = 2015)
#  df <- get_bls_county()
#  
#  # Slice the df down to only the variables we need and rename "fips" colunm
#  # so I can get a cleaner merge later.
#  df <- subset(df, select = c("unemployed_rate", "fips"))
#  colnames(df) <- c("unemployed_rate", "GEOID")
#  
#  # Merge df with spatial object.
#  leafmap <- geo_join(map.shape, df, by="GEOID")
#  
#  # Format popup data for leaflet map.
#  popup_dat <- paste0("<strong>County: </strong>",
#                      leafmap$NAME,
#                      "<br><strong>Value: </strong>",
#                      leafmap$unemployed_rate)
#  
#  pal <- colorQuantile("YlOrRd", NULL, n = 20)
#  # Render final map in leaflet.
#  leaflet(data = leafmap) %>% addTiles() %>%
#      addPolygons(fillColor = ~pal(unemployed_rate),
#                  fillOpacity = 0.8,
#                  color = "#BDBDC3",
#                  weight = 1,
#                  popup = popup_dat)
#  

