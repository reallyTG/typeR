library(rbokeh)


### Name: rbokehOutput
### Title: Widget output function for use in Shiny
### Aliases: rbokehOutput

### ** Examples

## Not run: 
##D library("shiny")
##D library("rbokeh")
##D 
##D ui <- fluidPage(
##D   rbokehOutput("rbokeh")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$rbokeh <- renderRbokeh({
##D     # Use invalidateLater() and jitter() to add some motion
##D     invalidateLater(1000, session)
##D     figure() %>%
##D       ly_points(jitter(cars$speed), jitter(cars$dist))
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D library("shiny")
##D library("rbokeh")
##D 
##D ui <- fluidPage(
##D   rbokehOutput("rbokeh", width = 500, height = 540),
##D   textOutput("x_range_text")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$rbokeh <- renderRbokeh({
##D     figure() %>% ly_points(1:10) %>%
##D       x_range(callback = shiny_callback("x_range"))
##D   })
##D 
##D   output$x_range_text <- reactive({
##D     xrng <- input$x_range
##D     if(!is.null(xrng)) {
##D       paste0("factors: ", xrng$factors, ", start: ", xrng$start,
##D         ", end: ", xrng$end)
##D     } else {
##D       "waiting for axis event..."
##D     }
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)



