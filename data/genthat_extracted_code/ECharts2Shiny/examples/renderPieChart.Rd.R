library(ECharts2Shiny)


### Name: renderPieChart
### Title: Render the Pie Chart Plotted by ECharts into Shiny Application
### Aliases: renderPieChart

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  dat <- c(rep("Type-A", 8),
             rep("Type-B", 5),
             rep("Type-C", 1))


  # Server function -------------------------------------------
  server <- function(input, output) {
    renderPieChart(div_id = "test",
                    data = dat)
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




