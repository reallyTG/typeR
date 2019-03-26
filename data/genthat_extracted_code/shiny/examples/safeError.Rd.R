library(shiny)


### Name: safeError
### Title: Declare an error safe for the user to see
### Aliases: safeError

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

# uncomment the desired line to experiment with shiny.sanitize.errors
# options(shiny.sanitize.errors = TRUE)
# options(shiny.sanitize.errors = FALSE)

# Define UI
ui <- fluidPage(
  textInput('number', 'Enter your favorite number from 1 to 10', '5'),
  textOutput('normalError'),
  textOutput('safeError')
)

# Server logic
server <- function(input, output) {
  output$normalError <- renderText({
    number <- input$number
    if (number %in% 1:10) {
      return(paste('You chose', number, '!'))
    } else {
      stop(
        paste(number, 'is not a number between 1 and 10')
      )
    }
  })
  output$safeError <- renderText({
    number <- input$number
    if (number %in% 1:10) {
      return(paste('You chose', number, '!'))
    } else {
      stop(safeError(
        paste(number, 'is not a number between 1 and 10')
      ))
    }
  })
}

# Complete app with UI and server components
shinyApp(ui, server)
}



