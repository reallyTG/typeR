library(dqshiny)


### Name: dq_helptag
### Title: Creates a help symbol with the given title as popover
### Aliases: dq_helptag

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init(),
    fluidRow(
      column(3,
        dq_helptag(
        "This info is visible after an click!<br>
        Line breaks are also possible btw...",
                  trigger = "focus"
                  ),
        textInput("importantValue",
          tagList("Important Value",
            dq_helptag(
            "This is an important value, you have to put something in!"
            ))
      ))
    )),
  server = function(input, output) {
  }
)

}



