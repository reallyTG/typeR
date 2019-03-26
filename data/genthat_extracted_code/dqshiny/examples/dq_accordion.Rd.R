library(dqshiny)


### Name: dq_accordion
### Title: Accordion module to show several collapsible boxes
### Aliases: dq_accordion

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
titles <- c("Section 1", "Section 2", "Section 3")
contents <- list("Lorem ipsum..", "Lorem ipsum..", tags$p("Lorem ipsum.."))
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(5, dq_accordion("myAccordion", titles, contents, hover = FALSE,
        style = "border:1px solid red;margin-top: 5px;color: red;"
      ), dq_space(),
      dq_accordion("myAccordion2", titles, contents,
        bg_color = NULL, options = list(animate = 500, collapsible = TRUE),
        icons = c(open = "hand-point-down", closed = "hand-point-right")
      ), dq_space(),
      dq_accordion("myAccordion3", titles, contents,
        bg_color = "pink", icons = NULL, sortable = TRUE
      ))
    )
  ), server = function(input, output) {
    observeEvent(input$myAccordion, print(input$myAccordion))
  }
)

}



