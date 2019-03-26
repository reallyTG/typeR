library(shinyjs)


### Name: reset
### Title: Reset input elements to their original values
### Aliases: reset

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      div(
        id = "form",
        textInput("name", "Name", "Dean"),
        radioButtons("gender", "Gender", c("Male", "Female")),
        selectInput("letter", "Favourite letter", LETTERS)
      ),
      actionButton("resetAll", "Reset all"),
      actionButton("resetName", "Reset name"),
      actionButton("resetGender", "Reset Gender"),
      actionButton("resetLetter", "Reset letter")
    ),
    server = function(input, output) {
      observeEvent(input$resetName, {
        reset("name")
      })
      observeEvent(input$resetGender, {
        reset("gender")
      })
      observeEvent(input$resetLetter, {
        reset("letter")
      })
      observeEvent(input$resetAll, {
        reset("form")
      })
    }
  )
}



