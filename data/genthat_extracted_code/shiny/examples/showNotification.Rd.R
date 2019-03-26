library(shiny)


### Name: showNotification
### Title: Show or remove a notification
### Aliases: showNotification removeNotification

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {
# Show a message when button is clicked
shinyApp(
  ui = fluidPage(
    actionButton("show", "Show")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showNotification("Message text",
        action = a(href = "javascript:location.reload();", "Reload page")
      )
    })
  }
)

# App with show and remove buttons
shinyApp(
  ui = fluidPage(
    actionButton("show", "Show"),
    actionButton("remove", "Remove")
  ),
  server = function(input, output) {
    # A queue of notification IDs
    ids <- character(0)
    # A counter
    n <- 0

    observeEvent(input$show, {
      # Save the ID for removal later
      id <- showNotification(paste("Message", n), duration = NULL)
      ids <<- c(ids, id)
      n <<- n + 1
    })

    observeEvent(input$remove, {
      if (length(ids) > 0)
        removeNotification(ids[1])
      ids <<- ids[-1]
    })
  }
)
}



