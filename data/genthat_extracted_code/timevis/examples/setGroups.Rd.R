library(timevis)


### Name: setGroups
### Title: Set the groups of a timeline
### Aliases: setGroups

### ** Examples


timevis(data = data.frame(
  start = c(Sys.Date(), Sys.Date(), Sys.Date() + 1, Sys.Date() + 2),
  content = c("one", "two", "three", "four"),
  group = c(1, 2, 1, 2)),
  groups = data.frame(id = 1:2, content = c("G1", "G2"))
) %>%
  setGroups(data.frame(id = 1:2, content = c("Group 1", "Group 2")))


if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Change group names")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(data = data.frame(
               start = c(Sys.Date(), Sys.Date(), Sys.Date() + 1, Sys.Date() + 2),
                         content = c("one", "two", "three", "four"),
                         group = c(1, 2, 1, 2)),
              groups = data.frame(id = 1:2, content = c("G1", "G2")))

    )
    observeEvent(input$btn, {
      setGroups("timeline",
               data.frame(id = 1:2, content = c("Group 1", "Group 2")))
    })
  }
)
}



