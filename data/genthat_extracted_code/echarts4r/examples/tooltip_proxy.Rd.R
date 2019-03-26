library(echarts4r)


### Name: e_showtip_p
### Title: Tooltip Proxy
### Aliases: e_showtip_p e_hidetip_p

### ** Examples

## Not run: 
##D    library(shiny)
##D  
##D    ui <- fluidPage(
##D      fluidRow(
##D        actionButton("show", "Show tooltip"),
##D        actionButton("hide", "Hide tooltip")
##D      ),
##D      fluidRow(
##D        echarts4rOutput("plot"),
##D        h3("clicked Data"),
##D        verbatimTextOutput("clickedData"),
##D        h3("clicked Serie"),
##D        verbatimTextOutput("clickedSerie"),
##D        h3("clicked Row"),
##D        verbatimTextOutput("clickedRow")
##D      )
##D    )
##D    
##D    server <- function(input, output, session){
##D      output$plot <- renderEcharts4r({
##D        mtcars %>% 
##D          e_charts(mpg) %>% 
##D          e_line(disp, bind = carb, name = "displacement") %>% 
##D          e_line(hp) %>% 
##D          e_x_axis(min = 10) %>% 
##D          e_theme("westeros") 
##D      })
##D      
##D      observeEvent(input$show, {
##D        echarts4rProxy("plot") %>% 
##D          e_showtip_p(0)
##D      })
##D      
##D      observeEvent(input$hide, {
##D        echarts4rProxy("plot") %>% 
##D          e_hidetip_p()
##D      })
##D      
##D      output$clickedData <- renderPrint({
##D        input$plot_clicked_data
##D      })
##D      
##D      output$clickedSerie <- renderPrint({
##D        input$plot_clicked_serie
##D      })
##D      
##D      output$clickedRow <- renderPrint({
##D        input$plot_clicked_row
##D      })
##D      
##D    }
##D    
##D    shinyApp(ui, server)
## End(Not run) 




