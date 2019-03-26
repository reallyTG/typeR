library(shinyWidgets)


### Name: updatePrettyCheckboxGroup
### Title: Change the value of a pretty checkbox on the client
### Aliases: updatePrettyCheckboxGroup

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Update pretty checkbox group"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 6,
##D       prettyCheckboxGroup(inputId = "checkgroup1",
##D                           label = "Update my value!",
##D                           choices = month.name[1:4],
##D                           status = "danger",
##D                           icon = icon("remove")),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       checkboxGroupInput(
##D         inputId = "update1", label = "Update value :",
##D         choices = month.name[1:4], inline = TRUE
##D       )
##D     ),
##D     column(
##D       width = 6,
##D       prettyCheckboxGroup(inputId = "checkgroup2",
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
##D   output$res1 <- renderPrint(input$checkgroup1)
##D 
##D   observeEvent(input$update1, {
##D     if (is.null(input$update1)) {
##D       selected_ <- character(0) # no choice selected
##D     } else {
##D       selected_ <- input$update1
##D     }
##D     updatePrettyCheckboxGroup(session = session, inputId = "checkgroup1", selected = selected_)
##D   }, ignoreNULL = FALSE)
##D 
##D   output$res2 <- renderPrint(input$checkgroup2)
##D   observeEvent(input$update2, {
##D     updatePrettyCheckboxGroup(
##D       session = session, inputId = "checkgroup2",
##D       choices = sample(month.name, 4), prettyOptions = list(animation = "pulse", status = "info")
##D     )
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
##D 
## End(Not run)



