library(googleway)


### Name: google_charts
### Title: Google Charts
### Aliases: google_charts

### ** Examples

## Not run: 
##D 
##D set_key("your_api_key")
##D 
##D ## AREA
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 2),
##D     year = rep( c("year1", "year2")),
##D     arrivals = sample(1:100, size = nrow(tram_stops) * 2, replace = T),
##D     departures = sample(1:100, size = nrow(tram_stops) * 2, replace = T))
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'area',
##D    options = list(width = 400, chartArea = list(width = "50%")))
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
##D tram_route$id <- c(rep(1, 30), rep(2, 25))
##D 
##D lineCharts <- data.frame(id = rep(c(1,2), each = 2),
##D     year = rep( c("year1", "year2") ),
##D     arrivals = sample(1:100, size = 4),
##D     departures = sample(1:100, size = 4))
##D 
##D chartList <- list(data = lineCharts,
##D    type = 'area')
##D 
##D google_map() %>%
##D   add_polylines(data = tram_route, id = 'id',
##D     stroke_colour = "id", stroke_weight = 10,
##D     lat = "shape_pt_lat", lon = "shape_pt_lon",
##D     info_window = chartList
##D     )
##D 
## End(Not run)

## Not run: 
##D 
##D ## BAR
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 2),
##D     year = rep( c("year1", "year2")),
##D     arrivals = sample(1:100, size = nrow(tram_stops) * 2, replace = T),
##D     departures = sample(1:100, size = nrow(tram_stops) * 2, replace = T))
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'bar')
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
##D 
##D lineChart <- data.frame(id = 33,
##D     year = c("year1","year2"),
##D     val1 = c(1,2),
##D     val2 = c(2,1))
##D 
##D chartList <- list(data = lineChart, type = 'bar')
##D 
##D google_map() %>%
##D   add_polylines(data = melbourne[melbourne$polygonId == 33, ],
##D   polyline = "polyline",
##D   info_window = chartList)
##D 
## End(Not run)


## Not run: 
##D 
##D ## BUBBLE
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 4),
##D     ID = sample(letters, size = nrow(tram_stops) * 4, replace = T),
##D     time = sample(1:1440, size = nrow(tram_stops) * 4, replace = T),
##D     passengers = sample(1:100, size = nrow(tram_stops) * 4, replace = T),
##D     year = c("year1", "year2", "year3", "year4"),
##D     group = sample(50:100, size = nrow(tram_stops) * 4, replace = T))
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'bubble')
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)

## Not run: 
##D 
##D ## CANDLESTICK
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 5),
##D     day = rep(c("Mon", "Tues", "Weds", "Thurs", "Fri"), times = nrow(tram_stops) ),
##D     val1 = rep(c(20, 31, 50, 77, 68), times = nrow(tram_stops) ),
##D     val2 = rep(c(28, 38, 55, 77, 66), times = nrow(tram_stops) ),
##D     val3 = rep(c(38, 55, 77, 66, 22), times = nrow(tram_stops) ),
##D     val4 = rep(c(45, 66, 80, 50, 15), times = nrow(tram_stops) ) )
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'candlestick',
##D    options = list(legend = 'none',
##D      bar = list(groupWidth = "100%"),
##D      candlestick = list(
##D        fallingColor = list( strokeWidth = 0, fill = "#a52714"),
##D        risingColor = list( strokeWidth = 0, fill = "#0f9d58")
##D        )
##D      ))
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)


## Not run: 
##D 
##D ## COLUMN
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 2),
##D     year = rep( c("year1", "year2")),
##D     arrivals = sample(1:100, size = nrow(tram_stops) * 2, replace = T),
##D     departures = sample(1:100, size = nrow(tram_stops) * 2, replace = T))
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'column')
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
##D polyChart <- data.frame(id = 33,
##D     year = c("year1","year2"),
##D     val1 = c(1,2),
##D     val2 = c(2,1))
##D 
##D chartList <- list(data = polyChart, type = 'column')
##D 
##D google_map() %>%
##D   add_polygons(data = melbourne[melbourne$polygonId == 33, ],
##D   polyline = "polyline",
##D   info_window = chartList)
##D 
##D tram_route$id <- 1
##D 
##D polyChart <- data.frame(id = 1,
##D     year = c("year1","year2"),
##D     val1 = c(1,2),
##D     val2 = c(2,1))
##D 
##D chartList <- list(data = polyChart, type = 'column')
##D 
##D google_map() %>%
##D   add_polygons(data = tram_route,
##D     lon = "shape_pt_lon", lat = "shape_pt_lat",
##D     info_window = chartList)
##D 
##D 
## End(Not run)

## Not run: 
##D 
##D 
##D ## COMBO
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 2),
##D     year = rep( c("year1", "year2")),
##D     arrivals = sample(1:100, size = nrow(tram_stops) * 2, replace = T),
##D     departures = sample(1:100, size = nrow(tram_stops) * 2, replace = T))
##D 
##D markerCharts$val <- sample(1:100, size = nrow(markerCharts), replace = T)
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'combo',
##D    options = list(
##D      "title" = "Passengers at stops",
##D      "vAxis" = list( title = "passengers" ),
##D      "hAxis" = list( title = "load" ),
##D      "seriesType" = "bars",
##D      "series" = list( "2" = list( "type" = "line" )))) ## 0-indexed
##D 
##D google_map() %>%
##D   add_circles(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)


## Not run: 
##D 
##D ## HISTOGRAM
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 20),
##D     day = as.character(1:20))
##D 
##D markerCharts$wait <- rnorm(nrow(markerCharts), 0, 1)
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'histogram')
##D 
##D google_map() %>%
##D   add_circles(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)


## Not run: 
##D 
##D ## Line
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 20),
##D     day = as.character(1:20),
##D     value = sample(1:100, size = nrow(tram_stops) * 20, replace = T))
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'line')
##D 
##D google_map() %>%
##D   add_circles(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)


## Not run: 
##D 
##D ## PIE
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 3))
##D markerCharts$variable <- c("yes", "no", "maybe")
##D markerCharts$value <- sample(1:10, size = nrow(markerCharts), replace = T)
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'pie',
##D    options = list(title = "my pie",
##D      is3D = TRUE,
##D      height = 240,
##D      width = 240,
##D      colors = c('#440154', '#21908C', '#FDE725')))
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
##D ## use pieHole option to make a donut chart
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'pie',
##D    options = list(title = "my pie",
##D      pieHole = 0.4,
##D      height = 240,
##D      width = 240,
##D      colors = c('#440154', '#21908C', '#FDE725')))
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
##D 
## End(Not run)


## Not run: 
##D 
##D ## SCATTER
##D markerCharts <- data.frame(stop_id = rep(tram_stops$stop_id, each = 5))
##D markerCharts$arrival <- sample(1:10, size = nrow(markerCharts), replace = T)
##D markerCharts$departure <- sample(1:10, size = nrow(markerCharts), replace = T)
##D 
##D chartList <- list(data = markerCharts,
##D    type = 'scatter')
##D 
##D google_map() %>%
##D   add_markers(data = tram_stops, info_window = chartList, id = "stop_id")
## End(Not run)





