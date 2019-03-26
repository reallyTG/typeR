library(shinyWidgets)


### Name: pickerOptions
### Title: Options for 'pickerInput'
### Aliases: pickerOptions

### ** Examples


if (interactive()) {
  library(shiny)
  library(shinyWidgets)

  ui <- fluidPage(
    pickerInput(
      inputId = "month",
      label = "Select a month",
      choices = month.name,
      multiple = TRUE,
      options = pickerOptions(
        actionsBox = TRUE,
        title = "Please select a month",
        header = "This is a title"
      )
    )
  )

  server <- function(input, output, session) {

  }

  shinyApp(ui, server)
}




