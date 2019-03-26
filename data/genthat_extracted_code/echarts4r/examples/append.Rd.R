library(echarts4r)


### Name: e_append1_p
### Title: Append data
### Aliases: e_append1_p e_append1_p_ e_append2_p e_append2_p_

### ** Examples

## Not run: 
##D   library(shiny)
##D   
##D   ui <- fluidPage(
##D     actionButton("add", "Add Data to y"),
##D     echarts4rOutput("plot"),
##D     h4("Brush"),
##D     verbatimTextOutput("selected"),
##D     h4("Legend select change"),
##D     verbatimTextOutput("legend")
##D   )
##D   
##D   server <- function(input, output, session){
##D   
##D     data <- data.frame(x = rnorm(10, 5, 3), y = rnorm(10, 50, 12), z = rnorm(10, 50, 5))
##D     
##D     react <- eventReactive(input$add, {
##D       set.seed(sample(1:1000, 1))
##D       data.frame(x = rnorm(10, 5, 2), y = rnorm(10, 50, 10), z = rnorm(10, 1, 5))
##D     })
##D     
##D     output$plot <- renderEcharts4r({
##D       data %>% 
##D        e_charts(x) %>% 
##D        e_scatter(y, z) %>%
##D        e_scatter(z) %>% 
##D        e_brush()
##D     })
##D     
##D     observeEvent(input$add, {
##D       echarts4rProxy("plot") %>% 
##D         e_append2_p(0, react(), x, y, z)
##D     })
##D     
##D     output$selected <- renderPrint({
##D       input$plot_brush
##D     })
##D     
##D     output$legend <- renderPrint({
##D       input$plot_legend_change
##D     })
##D     
##D   }
##D   
##D   shinyApp(ui, server)
##D   
## End(Not run)




