library(echarts4r)


### Name: e_focus_adjacency_p
### Title: Node Adjacency
### Aliases: e_focus_adjacency_p e_unfocus_adjacency_p

### ** Examples

value <- rnorm(10, 10, 2)

nodes <- data.frame(
  name = sample(LETTERS, 10),
  value = value,
  size = value,
  grp = rep(c("grp1", "grp2"), 5),
  stringsAsFactors = FALSE
)

edges <- data.frame(
  source = sample(nodes$name, 20, replace = TRUE),
  target = sample(nodes$name, 20, replace = TRUE),
  stringsAsFactors = FALSE
)

## Not run: 
##D 
##D   library(shiny)
##D 
##D   ui <- fluidPage(
##D     fluidRow(
##D       column(
##D         2, numericInput("index", "Node", value = 3, min = 1, max = 9)
##D       ),
##D       column(
##D         2, br(), actionButton("focus", "Focus")
##D       ),
##D       column(
##D         2, br(), actionButton("unfocus", "Unfocus")
##D       )
##D     ),
##D     fluidRow(
##D       column(12, echarts4rOutput("graph"))
##D     )
##D   )
##D   
##D   server <- function(input, output, session){
##D   
##D     output$graph <- renderEcharts4r({
##D       e_charts() %>% 
##D         e_graph() %>% 
##D         e_graph_nodes(nodes, name, value, size, grp) %>% 
##D         e_graph_edges(edges, source, target)
##D     })
##D     
##D     observeEvent(input$focus, {
##D     
##D       echarts4rProxy("graph") %>% 
##D         e_focus_adjacency(
##D           seriesIndex = 0,
##D           index = input$index
##D         )
##D     
##D     })
##D     
##D     observeEvent(input$unfocus, {
##D       
##D       echarts4rProxy("graph") %>% 
##D         e_unfocus_adjacency(seriesIndex = 0)
##D       
##D     })
##D   
##D   }
##D   
##D   shinyApp(ui, server)
##D 
## End(Not run)




