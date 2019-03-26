library(ECharts2Shiny)


### Name: renderScatter
### Title: Render the Scatter Plots Plotted by ECharts into Shiny
###   Application
### Aliases: renderScatter

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  dat <- data.frame(x = iris$Sepal.Length,
                    y = iris$Sepal.Width,
                    group = iris$Species)


  # Server function -------------------------------------------
  server <- function(input, output) {
    renderScatter("test", data = dat)
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




