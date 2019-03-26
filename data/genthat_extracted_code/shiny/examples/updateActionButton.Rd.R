library(shiny)


### Name: updateActionButton
### Title: Change the label or icon of an action button on the client
### Aliases: updateActionButton

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  actionButton("update", "Update other buttons"),
  br(),
  actionButton("goButton", "Go"),
  br(),
  actionButton("goButton2", "Go 2", icon = icon("area-chart")),
  br(),
  actionButton("goButton3", "Go 3")
)

server <- function(input, output, session) {
  observe({
    req(input$update)

    # Updates goButton's label and icon
    updateActionButton(session, "goButton",
      label = "New label",
      icon = icon("calendar"))

    # Leaves goButton2's label unchaged and
    # removes its icon
    updateActionButton(session, "goButton2",
      icon = character(0))

    # Leaves goButton3's icon, if it exists,
    # unchaged and changes its label
    updateActionButton(session, "goButton3",
      label = "New label 3")
  })
}

shinyApp(ui, server)
}



