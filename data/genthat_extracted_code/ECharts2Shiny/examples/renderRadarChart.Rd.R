library(ECharts2Shiny)


### Name: renderRadarChart
### Title: Render the Radar Chart Plotted by ECharts into Shiny Application
### Aliases: renderRadarChart

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  dat <- data.frame(Type.A = c(4300, 10000, 25000, 35000, 50000),
                    Type.B = c(5000, 14000, 28000, 31000, 42000),
                    Type.C = c(4000, 2000, 9000, 29000, 35000))
  row.names(dat) <- c("Feture 1", "Feature 2", "Feature 3", "Feature 4", "Feature 5")


  # Server function -------------------------------------------
  server <- function(input, output) {
    renderRadarChart(div_id = "test",
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



