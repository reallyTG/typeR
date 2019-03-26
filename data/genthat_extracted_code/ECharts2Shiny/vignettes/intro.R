## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ECharts2Shiny")

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github("XD-DENG/ECharts2Shiny")

## ---- eval=FALSE---------------------------------------------------------
#  library(shiny)
#  library(ECharts2Shiny)
#  
#  # Prepare sample data for plotting --------------------------
#  dat <- data.frame(c(1, 2, 3),
#                    c(2, 4, 6))
#  names(dat) <- c("Type-A", "Type-B")
#  row.names(dat) <- c("Time-1", "Time-2", "Time-3")
#  
#  # Server function -------------------------------------------
#  server <- function(input, output) {
#    # Call functions from ECharts2Shiny to render charts
#    renderBarChart(div_id = "test", grid_left = '1%', direction = "vertical",
#                   data = dat)
#  }
#  
#  # UI layout -------------------------------------------------
#  ui <- fluidPage(
#    # We MUST load the ECharts javascript library in advance
#    loadEChartsLibrary(),
#  
#    tags$div(id="test", style="width:50%;height:400px;"),
#    deliverChart(div_id = "test")
#  )
#  
#  # Run the application --------------------------------------
#  shinyApp(ui = ui, server = server)

## ---- out.width = 400, echo = FALSE--------------------------------------
knitr::include_graphics("Capture.png")

