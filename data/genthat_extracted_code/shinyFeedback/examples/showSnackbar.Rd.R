library(shinyFeedback)


### Name: showSnackbar
### Title: showSnackbar
### Aliases: showSnackbar

### ** Examples


## Only run examples in interacive R sessions
if (interactive()) {
  
  ui <- fluidPage(
    useShinyFeedback(),
    
    actionButton(
      "showSnackbarBtn",
      "Show Snackbar"
    ),
    
    snackbar(
      id = "mySnackbar",
      message = "Have a snack!"
    )
  )
  
  server <- function(input, output) {
    observeEvent(input$showSnackbarBtn, {
      showSnackbar("mySnackbar")
    })
  }
  
  shinyApp(ui, server)
}




