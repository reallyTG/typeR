library(ECharts2Shiny)


### Name: renderGauge
### Title: Render the Gauge Chart Plotted by ECharts into Shiny Application
### Aliases: renderGauge

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  # Server function -------------------------------------------
  server <- function(input, output) {
    # Call functions from ECharts2Shiny to render charts
    renderGauge(div_id = "test",rate = 99, gauge_name = "Finish Rate")
  }

  # UI layout -------------------------------------------------
  ui <- fluidPage(
    # We MUST load the ECharts javascript library in advance
    loadEChartsLibrary(),

    tags$div(id="test", style="width:50%;height:400px;"),
    deliverChart(div_id = "test")
  )

  # Run the application --------------------------------------
  shinyApp(ui = ui, server = server)
}



