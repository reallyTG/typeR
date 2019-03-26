library(rAmCharts)


### Name: rAmCharts-shinymodules-ts
### Title: Shiny module to render large time-series data with live
###   server-client aggregation
### Aliases: rAmCharts-shinymodules-ts rAmChartsTimeSeriesUI
###   rAmChartsTimeSeriesServer

### ** Examples


## Not run: 
##D 
##D library(shiny)
##D library(rAmCharts)
##D 
##D # number of points
##D n <- 1000000
##D data <- data.frame(date = seq(c(ISOdate(1999,12,31)), by = "5 min", length.out = n),
##D                           value = rnorm(n, 100, 50))
##D 
##D # maximun of points in javascript
##D max_points <- 1000
##D 
##D # Call module in UI
##D ui <- fluidPage(
##D   rAmChartsTimeSeriesUI("ts_1", height = "600px"),
##D   h4(textOutput("ts"))
##D )
##D 
##D # Define server
##D server <- function(input, output) {
##D   
##D   # Call module in server
##D   res <- callModule(rAmChartsTimeSeriesServer, "ts_1", reactive(data), reactive("date"), 
##D      reactive("value"), maxPoints = shiny::reactive(max_points),
##D      main = reactive("Example of rAmChartsTimeSeries module"),
##D      color = reactive("red"), periodFieldsSelection = reactive(TRUE), 
##D      ZoomButton = reactive(data.frame(Unit = c("DD", "DD", "MAX"), 
##D          multiple = c(1, 7 ,1), label = c("Day","Week", "MAX"), 
##D          selected = c(F, F, T)))
##D    )
##D    
##D   # show module return and print ts
##D   output$ts <- renderText({
##D     print(res())
##D     paste0("Current ts : ", res()$ts)
##D   })
##D  
##D }
##D 
##D # Run the application 
##D shinyApp(ui = ui, server = server)
##D 
## End(Not run)




