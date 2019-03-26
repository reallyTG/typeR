## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "# ",
  eval = F
)

## ----packages, eval = TRUE, message = FALSE------------------------------
library(mapdeck)

## ---- fig.width=6--------------------------------------------------------
#  key <- 'abc'    ## put your own token here
#  mapdeck(token = key)

## ---- eval = T-----------------------------------------------------------
set_token('abc')
mapdeck_tokens()

## ---- fig.width=6--------------------------------------------------------
#  mapdeck(token = key, style = 'mapbox://styles/mapbox/dark-v9')

## ------------------------------------------------------------------------
#  mapdeck_style(style = 'dark')

## ------------------------------------------------------------------------
#  
#  url <- 'https://raw.githubusercontent.com/plotly/datasets/master/2011_february_aa_flight_paths.csv'
#  flights <- read.csv(url)
#  flights$id <- seq_len(nrow(flights))
#  flights$stroke <- sample(1:3, size = nrow(flights), replace = T)
#  
#  mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
#    add_arc(
#      data = flights
#      , layer_id = "arc_layer"
#      , origin = c("start_lon", "start_lat")
#      , destination = c("end_lon", "end_lat")
#      , stroke_from = "airport1"
#      , stroke_to = "airport2"
#      , stroke_width = "stroke"
#    )

## ------------------------------------------------------------------------
#  mapdeck(
#    token = key
#    , location = c(145, -37.9)
#    , zoom = 8
#    , style = "mapbox://styles/mapbox/dark-v9"
#    , pitch = 35
#    ) %>%
#  	add_geojson(
#      data = geojson
#      , layer_id = "geojson"
#    )

## ------------------------------------------------------------------------
#  df <- read.csv(paste0(
#  'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/',
#  'examples/3d-heatmap/heatmap-data.csv'
#  ))
#  
#  mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
#  add_grid(
#    data = df
#    , lat = "lat"
#    , lon = "lng"
#    , cell_size = 5000
#    , elevation_scale = 50
#    , layer_id = "grid_layer"
#  )

## ------------------------------------------------------------------------
#  url <- 'https://raw.githubusercontent.com/plotly/datasets/master/2011_february_aa_flight_paths.csv'
#  flights <- read.csv(url)
#  flights$id <- seq_len(nrow(flights))
#  flights$stroke <- sample(1:3, size = nrow(flights), replace = T)
#  
#  mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
#    add_line(
#      data = flights
#      , layer_id = "line_layer"
#      , origin = c("start_lon", "start_lat")
#      , destination = c("end_lon", "end_lat")
#      , stroke_colour = "airport1"
#      , stroke_width = "stroke"
#    )

## ------------------------------------------------------------------------
#  mapdeck(
#    token = key
#    , style = 'mapbox://styles/mapbox/dark-v9'
#    , location = c(145, -37.8)
#    , zoom = 10) %>%
#    add_path(
#      data = roads
#      , stroke_colour = "RIGHT_LOC"
#      , layer_id = "path_layer"
#    )
#  

## ------------------------------------------------------------------------
#  df <- capitals
#  df$z <- sample(10000:10000000, size = nrow(df))
#  
#  mapdeck(token = key, style = 'mapbox://styles/mapbox/dark-v9') %>%
#  add_pointcloud(
#    data = df
#    , lon = 'lon'
#    , lat = 'lat'
#    , elevation = 'z'
#    , layer_id = 'point'
#    , fill_colour = "country"
#  )

## ------------------------------------------------------------------------
#  library(sf)
#  library(geojsonsf)
#  
#  sf <- geojson_sf("https://symbolixau.github.io/data/geojson/SA2_2016_VIC.json")
#  
#  mapdeck(token = key, style = 'mapbox://styles/mapbox/dark-v9') %>%
#    add_polygon(
#      data = sf
#      , layer = "polygon_layer"
#      , fill_colour = "SA2_NAME16"
#    )

## ------------------------------------------------------------------------
#  
#  mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
#  add_scatterplot(
#    data = capitals
#    , lat = "lat"
#    , lon = "lon"
#    , radius = 100000
#    , fill_colour = "country"
#    , layer_id = "scatter_layer"
#  )
#  

## ------------------------------------------------------------------------
#  df <- read.csv(paste0(
#  'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/',
#  'examples/3d-heatmap/heatmap-data.csv'
#  ))
#  
#  df$weight <- sample(1:10, size = nrow(df), replace = T)
#  
#  mapdeck( token = key, style = mapdeck_style('dark'), pitch = 45 ) %>%
#  add_screengrid(
#    data = df
#    , lat = "lat"
#    , lon = "lng"
#    , weight = "weight"
#    , layer_id = "screengrid_layer"
#    , cell_size = 10
#    , opacity = 0.3
#  )

## ------------------------------------------------------------------------
#  mapdeck(token = key, style = mapdeck_style('dark')) %>%
#    add_text(
#      data = capitals
#      , lon = 'lon'
#      , lat = 'lat'
#      , fill_colour = 'country'
#      , text = 'capital'
#      , layer_id = 'text'
#    )

## ------------------------------------------------------------------------
#  
#  df1 <- capitals[ capitals$country == "Australia", ]
#  df2 <- capitals[ capitals$country != "Australia", ]
#  df1$key <- 1L
#  df2$key <- 1L
#  
#  df <- merge(df1, df2, by = 'key')
#  
#  mapdeck(
#    token = key
#    , style = 'mapbox://styles/mapbox/dark-v9'
#    , pitch = 35
#    ) %>%
#    add_arc(
#      data = df
#      , origin = c("lon.x", "lat.x")
#      , destination = c("lon.y", "lat.y")
#      , layer_id = "arc_layer"
#      , stroke_from = "country.x"
#      , stroke_to = "country.y"
#      , stroke_width = 2
#      ) %>%
#  	add_scatterplot(
#      data = df2
#      , lon = "lon"
#      , lat = "lat"
#      , radius = 100000
#      , fill_colour = "country"
#      , layer_id = "scatter"
#    )
#  
#  

## ------------------------------------------------------------------------
#  library(shiny)
#  library(shinydashboard)
#  library(jsonlite)
#  ui <- dashboardPage(
#  	dashboardHeader()
#  	, dashboardSidebar()
#  	, dashboardBody(
#  		mapdeckOutput(
#  			outputId = 'myMap'
#  			),
#  		sliderInput(
#  			inputId = "longitudes"
#  			, label = "Longitudes"
#  			, min = -180
#  			, max = 180
#  			, value = c(-90, 90)
#  		)
#  		, verbatimTextOutput(
#  			outputId = "observed_click"
#  		)
#  	)
#  )
#  server <- function(input, output) {
#  	
#  	set_token('abc') ## set your access token
#  	
#  	origin <- capitals[capitals$country == "Australia", ]
#  	destination <- capitals[capitals$country != "Australia", ]
#  	origin$key <- 1L
#  	destination$key <- 1L
#  	
#  	df <- merge(origin, destination, by = 'key', all = T)
#  	
#  	output$myMap <- renderMapdeck({
#  		mapdeck(style = mapdeck_style('dark'))
#  	})
#  	
#  	## plot points & lines according to the selected longitudes
#  	df_reactive <- reactive({
#  		if(is.null(input$longitudes)) return(NULL)
#  		lons <- input$longitudes
#  		return(
#  			df[df$lon.y >= lons[1] & df$lon.y <= lons[2], ]
#  		)
#  	})
#  	
#  	observeEvent({input$longitudes}, {
#  		if(is.null(input$longitudes)) return()
#  		
#  		mapdeck_update(map_id = 'myMap') %>%
#  			add_scatterplot(
#  				data = df_reactive()
#  				, lon = "lon.y"
#  				, lat = "lat.y"
#  				, fill_colour = "country.y"
#  				, radius = 100000
#  				, layer_id = "myScatterLayer"
#  			) %>%
#  			add_arc(
#  				data = df_reactive()
#  				, origin = c("lon.x", "lat.x")
#  				, destination = c("lon.y", "lat.y")
#  				, layer_id = "myArcLayer"
#  				, stroke_width = 4
#  			)
#  	})
#  	
#  	## observe clicking on a line and return the text
#  	observeEvent(input$myMap_arc_click, {
#  		
#  		event <- input$myMap_arc_click
#  		output$observed_click <- renderText({
#  			jsonlite::prettify( event )
#  		})
#  	})
#  }
#  
#  shinyApp(ui, server)

