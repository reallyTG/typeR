library(timevis)


### Name: setOptions
### Title: Update the configuration options of a timeline
### Aliases: setOptions

### ** Examples


timevis(
  data.frame(start = Sys.Date(), content = "Today"),
  options = list(showCurrentTime = FALSE, orientation = "top")
) %>%
  setOptions(list(editable = TRUE, showCurrentTime = TRUE))

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Show current time and allow items to be editable")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(
        data.frame(start = Sys.Date(), content = "Today"),
        options = list(showCurrentTime = FALSE, orientation = "top")
      )
    )
    observeEvent(input$btn, {
      setOptions("timeline", list(editable = TRUE, showCurrentTime = TRUE))
    })
  }
)
}



