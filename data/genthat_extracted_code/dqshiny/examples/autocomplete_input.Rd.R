library(dqshiny)


### Name: autocomplete_input
### Title: Creates an autocomplete text input field
### Aliases: autocomplete_input update_autocomplete_input

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
opts <- sapply(1:100000, function(i) paste0(sample(letters, 9), collapse=""))
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(3,
        autocomplete_input("auto1", "Unnamed:", opts, max_options = 1000),
        autocomplete_input("auto2", "Named:", max_options = 1000,
          structure(opts, names = opts[order(opts)])),
        autocomplete_input("auto3", "Big data:", NULL, max_options = 1000,
          placeholder = "Big data taking several seconds to load ..."),
        actionButton("calc", "Calculate")
      ), column(3,
        tags$label("Value:"), verbatimTextOutput("val1", placeholder = TRUE),
        tags$label("Value:"), verbatimTextOutput("val2", placeholder = TRUE)
       )
    )
  ),
  server = function(input, output, session) {
    output$val1 <- renderText(as.character(input$auto1))
    output$val2 <- renderText(as.character(input$auto2))
    observeEvent(input$calc, {
      Sys.sleep(3)
      update_autocomplete_input(session, "auto3", placeholder = "Loaded!",
        options = rownames(mtcars))
    })
  }
)

}



