library(ECharts2Shiny)


### Name: renderLineChart
### Title: Render the Line Chart Plotted by ECharts into Shiny Application
### Aliases: renderLineChart

### ** Examples

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  dat <- data.frame(c(1, 2, 3, 1),
                      c(2, 4, 6, 6),
                      c(3, 2, 7, 5))
  names(dat) <- c("Type-A", "Type-B", "Type-C")
  row.names(dat) <- c("Time-1", "Time-2", "Time-3", "Time-4")

  # Server function -------------------------------------------
  server <- function(input, output) {
    renderLineChart(div_id = "test",
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



