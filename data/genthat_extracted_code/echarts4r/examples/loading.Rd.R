library(echarts4r)


### Name: e_show_loading
### Title: Loading
### Aliases: e_show_loading e_hide_loading

### ** Examples

## Not run: 
##D 
##D # no redraw
##D # no loading
##D library(shiny)
##D ui <- fluidPage(
##D   fluidRow(
##D     column(12, actionButton("update", "Update"))
##D   ),
##D   fluidRow(
##D     column(12, echarts4rOutput("plot"))
##D   )
##D )
##D 
##D server <- function(input, output){
##D   data <- eventReactive(input$update, {
##D     data.frame(
##D       x = 1:10,
##D       y = rnorm(10)
##D     )
##D   })
##D   
##D   output$plot <- renderEcharts4r({
##D     data() %>% 
##D       e_charts(x) %>% 
##D       e_bar(y)
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D # add loading
##D server <- function(input, output){
##D   data <- eventReactive(input$update, {
##D     Sys.sleep(1) # sleep one second to show loading
##D     data.frame(
##D       x = 1:10,
##D       y = rnorm(10)
##D     )
##D   })
##D   
##D   output$plot <- renderEcharts4r({
##D     data() %>% 
##D       e_charts(x) %>% 
##D       e_bar(y) %>% 
##D       e_show_loading()
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




