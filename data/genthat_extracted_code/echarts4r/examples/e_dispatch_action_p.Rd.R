library(echarts4r)


### Name: e_dispatch_action_p
### Title: Dispatch Action
### Aliases: e_dispatch_action_p

### ** Examples

## Not run: 
##D 
##D   library(shiny)
##D 
##D   ui <- fluidPage(
##D     fluidRow(
##D       column(8, echarts4rOutput("chart")),
##D       column(4, actionButton("zoom", "Zoom"))
##D     )
##D   )
##D   
##D   server <- function(input, output, session){
##D   
##D     output$chart <- renderEcharts4r({
##D       cars %>% 
##D         e_charts(speed) %>% 
##D         e_scatter(dist) %>% 
##D         e_datazoom()
##D     })
##D     
##D     observe({
##D       req(input$zoom)
##D       
##D       echarts4rProxy("chart") %>% 
##D         e_dispatch_action_p("dataZoom", startValue = 1, endValue = 10)
##D     })
##D   
##D   }
##D   
##D   shinyApp(ui, server)
##D 
## End(Not run)




