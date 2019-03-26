library(dqshiny)


### Name: dq_box
### Title: Creates a html box with specified parameters
### Aliases: dq_box update_dq_box

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      dq_box(
        title = "Say Hello to my children", id = "bigBox", collapsed = TRUE,
        dq_infobox("hallo", 2, "Welt", icon("hashtag"),
                   bg_color = "black", color = "#D00"),
        dq_box(
          title = "Box in the box", bg_color = "pink", width = 8,
          dq_infobox("in the box...", 2, "in the box!", width = 12,
                     bg_color = "white", color = "#0D0")
          )
        ),
      column(3, actionButton("toggle", "Toggle Box"))
     )
  ),
  server = function(input, output) {
    observeEvent(input$toggle, update_dq_box("bigBox"))
  }
)

}



