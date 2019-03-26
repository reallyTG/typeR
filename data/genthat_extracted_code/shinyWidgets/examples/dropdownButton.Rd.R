library(shinyWidgets)


### Name: dropdownButton
### Title: Dropdown Button
### Aliases: dropdownButton

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   dropdownButton(
##D     inputId = "mydropdown",
##D     label = "Controls",
##D     icon = icon("sliders"),
##D     status = "primary",
##D     circle = FALSE,
##D     sliderInput(
##D       inputId = "n",
##D       label = "Number of observations",
##D       min = 10, max = 100, value = 30
##D     ),
##D     prettyToggle(
##D       inputId = "na",
##D       label_on = "NAs keeped",
##D       label_off = "NAs removed",
##D       icon_on = icon("check"),
##D       icon_off = icon("remove")
##D     )
##D   ),
##D   tags$div(style = "height: 140px;"), # spacing
##D   verbatimTextOutput(outputId = "out"),
##D   verbatimTextOutput(outputId = "state")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$out <- renderPrint({
##D     cat(
##D       " # n\n", input$n, "\n",
##D       "# na\n", input$na
##D     )
##D   })
##D 
##D   output$state <- renderPrint({
##D     cat("Open:", input$mydropdown_state)
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
## End(Not run)



