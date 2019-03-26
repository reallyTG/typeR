library(echarts4r)


### Name: e_highlight_p
### Title: Highlight Proxy
### Aliases: e_highlight_p e_downplay_p

### ** Examples

## Not run: 
##D 
##D  ui <- fluidPage(
##D    fluidRow(
##D      column(
##D        3,
##D        actionButton("highlightmpg", "Highlight MPG")
##D      ),
##D      column(
##D        3,
##D        actionButton("highlighthp", "Highlight HP")
##D      ),
##D      column(
##D        3,
##D        actionButton("downplaympg", "Downplay MPG")
##D      ),
##D      column(
##D        3,
##D        actionButton("downplayhp", "Downplay HP")
##D      )
##D    ),
##D    echarts4rOutput("plot")
##D  ) 
##D  
##D  server <- function(input, output, session){
##D    output$plot <- renderEcharts4r({
##D      mtcars %>% 
##D        e_charts(mpg) %>% 
##D        e_line(disp) %>% 
##D        e_line(hp, name = "HP") # explicitly pass name
##D    })
##D    
##D    # highlight
##D    
##D    observeEvent(input$highlightmpg, {
##D      echarts4rProxy("plot") %>% 
##D        e_highlight_p(series.index = 0) # using index
##D    })
##D    
##D    observeEvent(input$highlighthp, {
##D      echarts4rProxy("plot") %>% 
##D        e_highlight_p(series.name = "HP") # using name
##D    })
##D    
##D    # downplay
##D    
##D    observeEvent(input$downplaympg, {
##D      echarts4rProxy("plot") %>% 
##D        e_downplay_p(series.name = "disp")
##D    })
##D    
##D    observeEvent(input$downplayhp, {
##D      echarts4rProxy("plot") %>% 
##D        e_downplay_p(series.index = 1)
##D    })
##D  }
##D  
##D  shinyApp(ui, server)
##D 
## End(Not run)




