library(timevis)


### Name: addItems
### Title: Add multiple items to a timeline
### Aliases: addItems

### ** Examples


timevis() %>%
  addItems(data.frame(start = c(Sys.Date(), Sys.Date() - 1),
           content = c("Today", "Yesterday")))

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Add items today and yesterday")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn, {
      addItems("timeline",
               data.frame(start = c(Sys.Date(), Sys.Date() - 1),
                          content = c("Today", "Yesterday")))
    })
  }
)
}



