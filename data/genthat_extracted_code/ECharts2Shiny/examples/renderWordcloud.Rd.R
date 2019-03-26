library(ECharts2Shiny)


### Name: renderWordcloud
### Title: Render the Word Cloud Plotted by ECharts into Shiny Application
### Aliases: renderWordcloud

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  sample_data_for_wordcloud <- c(rep("R", 100),
                                 rep("Python", 100),
                                 rep("SAS", 90),
                                 rep("VBA", 50))


  # Server function -------------------------------------------
  server <- function(input, output) {
    renderWordcloud("test", data =sample_data_for_wordcloud,
                    grid_size = 10, sizeRange = c(20, 50))
  }

  # UI layout -------------------------------------------------
  ui <- fluidPage(
    # We MUST load the ECharts javascript library in advance
    loadEChartsLibrary(),

    tags$div(id="test", style="width:100%;height:500px;"),
    deliverChart(div_id = "test")
  )

  # Run the application --------------------------------------
  shinyApp(ui = ui, server = server)
}



