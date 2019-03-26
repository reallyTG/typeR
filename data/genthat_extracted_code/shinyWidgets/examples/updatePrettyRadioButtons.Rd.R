library(shinyWidgets)


### Name: updatePrettyRadioButtons
### Title: Change the value pretty radio buttons on the client
### Aliases: updatePrettyRadioButtons

### ** Examples

## Not run: 
##D 
##D  if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Update pretty radio buttons"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 6,
##D       prettyRadioButtons(inputId = "radio1",
##D                           label = "Update my value!",
##D                           choices = month.name[1:4],
##D                           status = "danger",
##D                           icon = icon("remove")),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       radioButtons(
##D         inputId = "update1", label = "Update value :",
##D         choices = month.name[1:4], inline = TRUE
##D       )
##D     ),
##D     column(
##D       width = 6,
##D       prettyRadioButtons(inputId = "radio2",
##D                           label = "Update my choices!", thick = TRUE,
##D                           choices = month.name[1:4],
##D                           animation = "pulse", status = "info"),
##D       verbatimTextOutput(outputId = "res2"),
##D       br(),
##D       actionButton(inputId = "update2", label = "Update choices !")
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$radio1)
##D 
##D   observeEvent(input$update1, {
##D     updatePrettyRadioButtons(
##D       session = session,
##D       inputId = "radio1",
##D       selected = input$update1
##D     )
##D   }, ignoreNULL = FALSE)
##D 
##D   output$res2 <- renderPrint(input$radio2)
##D   observeEvent(input$update2, {
##D     updatePrettyRadioButtons(
##D       session = session, inputId = "radio2",
##D       choices = sample(month.name, 4),
##D       prettyOptions = list(animation = "pulse",
##D                            status = "info",
##D                            shape = "round")
##D     )
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D  }
##D 
## End(Not run)



