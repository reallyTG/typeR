library(dqshiny)


### Name: icon_state_button
### Title: Creates a state button showing different icons
### Aliases: icon_state_button update_icon_state_button

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
hands <- paste0("hand-o-", c("up", "right", "down", "left"))
shinyApp(
  ui = fluidPage(
    fluidRow(column(12,
      icon_state_button("sort", c("sort", "sort-up", "sort-down")),
      icon_state_button("hands", hands, 1),
      icon_state_button("mood", c("smile-o", "meh-o", "frown-o"), "smile-o"),
      br(), actionButton("makeStars", "I like stars")
    ))
  ),
  server = function(input, output, session) {
    observeEvent(input$makeStars, update_icon_state_button(
      session, "mood", c("star", "star-half-o", "star-o"), "star"
    ))
  }
)

}



