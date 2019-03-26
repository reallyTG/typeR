library(shinyhttr)


### Name: progress
### Title: Add a progress bar compatible with
###   'shinyWidgets::updateProgressBar()'.
### Aliases: progress

### ** Examples


if (interactive()) {
  
  library(shiny)
  library(shinyWidgets)
  library(shinyhttr)
  
  ui <- fluidPage(
    
    sidebarLayout(
      
      NULL,
      
      mainPanel(
        actionButton('download', 'Download 100MB file...'),
        tags$p("see R console to compare both progress bars."),
        progressBar(
          id = "pb",
          value = 0,
          title = "",
          display_pct = TRUE
        )
      )
    )
  )
  
  server <- function(input, output, session) {
    observeEvent(input$download, {
      httr::GET(
        url = "https://speed.hetzner.de/100MB.bin",
        progress(session, id = "pb")
      )
    })
  }
  
  shinyApp(ui, server)
}



