library(shiny)


### Name: reactiveVal
### Title: Create a (single) reactive value
### Aliases: reactiveVal

### ** Examples


## Not run: 
##D 
##D # Create the object by calling reactiveVal
##D r <- reactiveVal()
##D 
##D # Set the value by calling with an argument
##D r(10)
##D 
##D # Read the value by calling without arguments
##D r()
##D 
## End(Not run)

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  actionButton("minus", "-1"),
  actionButton("plus", "+1"),
  br(),
  textOutput("value")
)

# The comments below show the equivalent logic using reactiveValues()
server <- function(input, output, session) {
  value <- reactiveVal(0)       # rv <- reactiveValues(value = 0)

  observeEvent(input$minus, {
    newValue <- value() - 1     # newValue <- rv$value - 1
    value(newValue)             # rv$value <- newValue
  })

  observeEvent(input$plus, {
    newValue <- value() + 1     # newValue <- rv$value + 1
    value(newValue)             # rv$value <- newValue
  })

  output$value <- renderText({
    value()                     # rv$value
  })
}

shinyApp(ui, server)

}




