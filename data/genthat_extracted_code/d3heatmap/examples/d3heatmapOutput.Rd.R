library(d3heatmap)


### Name: d3heatmapOutput
### Title: Wrapper functions for using d3heatmap in shiny
### Aliases: d3heatmapOutput renderD3heatmap

### ** Examples

## No test: 
library(d3heatmap)
library(shiny)

ui <- fluidPage(
  h1("A heatmap demo"),
  selectInput("palette", "Palette", c("YlOrRd", "RdYlBu", "Greens", "Blues")),
  checkboxInput("cluster", "Apply clustering"),
  d3heatmapOutput("heatmap")
)

server <- function(input, output, session) {
  output$heatmap <- renderD3heatmap({
    d3heatmap(
      scale(mtcars),
      colors = input$palette,
      dendrogram = if (input$cluster) "both" else "none"
    )
  })
}

shinyApp(ui, server)
## End(No test)
  



