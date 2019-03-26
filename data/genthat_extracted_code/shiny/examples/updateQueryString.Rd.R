library(shiny)


### Name: updateQueryString
### Title: Update URL in browser's location bar
### Aliases: updateQueryString

### ** Examples

## Only run these examples in interactive sessions
if (interactive()) {

  ## App 1: Doing "live" bookmarking
  ## Update the browser's location bar every time an input changes.
  ## This should not be used with enableBookmarking("server"),
  ## because that would create a new saved state on disk every time
  ## the user changes an input.
  enableBookmarking("url")
  shinyApp(
    ui = function(req) {
      fluidPage(
        textInput("txt", "Text"),
        checkboxInput("chk", "Checkbox")
      )
    },
    server = function(input, output, session) {
      observe({
        # Trigger this observer every time an input changes
        reactiveValuesToList(input)
        session$doBookmark()
      })
      onBookmarked(function(url) {
        updateQueryString(url)
      })
    }
  )

  ## App 2: Printing the value of the query string
  ## (Use the back and forward buttons to see how the browser
  ## keeps a record of each state)
  shinyApp(
    ui = fluidPage(
      textInput("txt", "Enter new query string"),
      helpText("Format: ?param1=val1&param2=val2"),
      actionButton("go", "Update"),
      hr(),
      verbatimTextOutput("query")
    ),
    server = function(input, output, session) {
      observeEvent(input$go, {
        updateQueryString(input$txt, mode = "push")
      })
      output$query <- renderText({
        query <- getQueryString()
        queryText <- paste(names(query), query,
                       sep = "=", collapse=", ")
        paste("Your query string is:\n", queryText)
      })
    }
  )
}



