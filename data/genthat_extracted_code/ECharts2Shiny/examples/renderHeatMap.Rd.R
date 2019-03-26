library(ECharts2Shiny)


### Name: renderHeatMap
### Title: Render Heat Map Plotted by ECharts into Shiny Applications
### Aliases: renderHeatMap

### ** Examples


if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  # Server function -------------------------------------------
  server <- function(input, output) {
    dat <- volcano
    row.names(dat) <- 1:dim(dat)[1]
    colnames(dat) <- 1:dim(dat)[2]

    renderHeatMap(div_id = "test",
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




