library(shinyWidgets)


### Name: prettyToggle
### Title: Pretty Toggle Input
### Aliases: prettyToggle

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty toggles"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 4,
##D       prettyToggle(inputId = "toggle1",
##D                    label_on = "Checked!",
##D                    label_off = "Unchecked..."),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       prettyToggle(inputId = "toggle4",  label_on = "Yes!",
##D                    label_off = "No..", outline = TRUE,
##D                    plain = TRUE,
##D                    icon_on = icon("thumbs-up"),
##D                    icon_off = icon("thumbs-down")),
##D       verbatimTextOutput(outputId = "res4")
##D     ),
##D     column(
##D       width = 4,
##D       prettyToggle(inputId = "toggle2",
##D                    label_on = "Yes!", icon_on = icon("check"),
##D                    status_on = "info", status_off = "warning",
##D                    label_off = "No..", icon_off = icon("remove")),
##D       verbatimTextOutput(outputId = "res2")
##D     ),
##D     column(
##D       width = 4,
##D       prettyToggle(inputId = "toggle3",  label_on = "Yes!",
##D                    label_off = "No..", shape = "round",
##D                    fill = TRUE, value = TRUE),
##D       verbatimTextOutput(outputId = "res3")
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$toggle1)
##D   output$res2 <- renderPrint(input$toggle2)
##D   output$res3 <- renderPrint(input$toggle3)
##D   output$res4 <- renderPrint(input$toggle4)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D 
##D # Inline example ----
##D 
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty toggles: inline example"),
##D   br(),
##D 
##D   prettyToggle(inputId = "toggle1",
##D                label_on = "Checked!",
##D                label_off = "Unchecked...",
##D                inline = TRUE),
##D   prettyToggle(inputId = "toggle2",
##D                label_on = "Yep",
##D                status_on = "default",
##D                icon_on = icon("ok-circle", lib = "glyphicon"),
##D                label_off = "Nope",
##D                status_off = "default",
##D                icon_off = icon("remove-circle", lib = "glyphicon"),
##D                plain = TRUE,
##D                inline = TRUE),
##D   prettyToggle(inputId = "toggle3",
##D                label_on = "",
##D                label_off = "",
##D                icon_on = icon("volume-up", lib = "glyphicon"),
##D                icon_off = icon("volume-off", lib = "glyphicon"),
##D                status_on = "primary",
##D                status_off = "default",
##D                plain = TRUE,
##D                outline = TRUE,
##D                bigger = TRUE,
##D                inline = TRUE),
##D   prettyToggle(inputId = "toggle4",
##D                label_on = "Yes!",
##D                label_off = "No..",
##D                outline = TRUE,
##D                plain = TRUE,
##D                icon_on = icon("thumbs-up"),
##D                icon_off = icon("thumbs-down"),
##D                inline = TRUE),
##D 
##D   verbatimTextOutput(outputId = "res")
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(c(input$toggle1,
##D                               input$toggle2,
##D                               input$toggle3,
##D                               input$toggle4))
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D 
##D }
##D 
## End(Not run)



