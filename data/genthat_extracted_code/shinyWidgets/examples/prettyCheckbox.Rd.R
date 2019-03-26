library(shinyWidgets)


### Name: prettyCheckbox
### Title: Pretty Checkbox Input
### Aliases: prettyCheckbox

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty checkbox"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 4,
##D       prettyCheckbox(inputId = "checkbox1",
##D                    label = "Click me!"),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       prettyCheckbox(inputId = "checkbox4",  label = "Click me!",
##D                      outline = TRUE,
##D                    plain = TRUE, icon = icon("thumbs-up")),
##D       verbatimTextOutput(outputId = "res4")
##D     ),
##D     column(
##D       width = 4,
##D       prettyCheckbox(inputId = "checkbox2",
##D                      label = "Click me!", thick = TRUE,
##D                      animation = "pulse", status = "info"),
##D       verbatimTextOutput(outputId = "res2"),
##D       br(),
##D       prettyCheckbox(inputId = "checkbox5",
##D                      label = "Click me!", icon = icon("check"),
##D                      animation = "tada", status = "default"),
##D       verbatimTextOutput(outputId = "res5")
##D     ),
##D     column(
##D       width = 4,
##D       prettyCheckbox(inputId = "checkbox3",  label = "Click me!",
##D                      shape = "round", status = "danger",
##D                    fill = TRUE, value = TRUE),
##D       verbatimTextOutput(outputId = "res3")
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$checkbox1)
##D   output$res2 <- renderPrint(input$checkbox2)
##D   output$res3 <- renderPrint(input$checkbox3)
##D   output$res4 <- renderPrint(input$checkbox4)
##D   output$res5 <- renderPrint(input$checkbox5)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D 
##D # Inline example ----
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty checkbox: inline example"),
##D   br(),
##D   prettyCheckbox(inputId = "checkbox1",
##D                  label = "Click me!",
##D                  status = "success",
##D                  outline = TRUE,
##D                  inline = TRUE),
##D   prettyCheckbox(inputId = "checkbox2",
##D                  label = "Click me!",
##D                  thick = TRUE,
##D                  shape = "curve",
##D                  animation = "pulse",
##D                  status = "info",
##D                  inline = TRUE),
##D   prettyCheckbox(inputId = "checkbox3",
##D                  label = "Click me!",
##D                  shape = "round",
##D                  status = "danger",
##D                  value = TRUE,
##D                  inline = TRUE),
##D   prettyCheckbox(inputId = "checkbox4",
##D                  label = "Click me!",
##D                  outline = TRUE,
##D                  plain = TRUE,
##D                  animation = "rotate",
##D                  icon = icon("thumbs-up"),
##D                  inline = TRUE),
##D   prettyCheckbox(inputId = "checkbox5",
##D                  label = "Click me!",
##D                  icon = icon("check"),
##D                  animation = "tada",
##D                  status = "primary",
##D                  inline = TRUE),
##D   verbatimTextOutput(outputId = "res")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(c(input$checkbox1,
##D                               input$checkbox2,
##D                               input$checkbox3,
##D                               input$checkbox4,
##D                               input$checkbox5))
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



