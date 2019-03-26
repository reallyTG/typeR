library(dqshiny)


### Name: click
### Title: Programmatically click a button
### Aliases: click

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      numericInput("clickBtn", "Click Btn Nr:", 1, 1, 3, 1),
      actionButton("btn1", "1"),
      actionButton("btn2", "2"),
      actionButton("btn3", "3"),
      dq_space(),
      textOutput("result")
    )
  ),
  server = function(input, output) {
    output$result <- renderText(paste("Buttons clicked:",
      toString(c(input$btn1, input$btn2, input$btn3))
    ))
    observeEvent(input$clickBtn, click(paste0("btn", input$clickBtn)),
                 ignoreInit = TRUE)
  }
)

}



