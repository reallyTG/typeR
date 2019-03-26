library(echarts4r)


### Name: e_capture
### Title: Capture event
### Aliases: e_capture

### ** Examples

## Not run: 
##D # add datazoom
##D library(shiny)
##D 
##D ui <- fluidPage(
##D   echarts4rOutput("chart"),
##D   verbatimTextOutput("zoom")
##D )
##D 
##D server <- function(input, output){
##D   output$chart <- renderEcharts4r({
##D     mtcars %>% 
##D       e_charts(mpg) %>% 
##D       e_scatter(qsec) %>% 
##D       e_datazoom() %>% 
##D       e_capture("datazoom")
##D   })
##D   
##D   output$zoom <- renderPrint({
##D     input$chart_datazoom
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




