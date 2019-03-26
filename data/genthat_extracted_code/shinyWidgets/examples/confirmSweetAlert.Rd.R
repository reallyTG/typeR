library(shinyWidgets)


### Name: confirmSweetAlert
### Title: Launch a confirmation dialog
### Aliases: confirmSweetAlert

### ** Examples


## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D 
##D ui <- fluidPage(
##D   tags$h1("Confirm sweet alert"),
##D   actionButton(
##D     inputId = "launch",
##D     label = "Launch confirmation dialog"
##D   ),
##D   verbatimTextOutput(outputId = "res"),
##D   uiOutput(outputId = "count")
##D )
##D 
##D server <- function(input, output, session) {
##D   # Launch sweet alert confirmation
##D   observeEvent(input$launch, {
##D     confirmSweetAlert(
##D       session = session,
##D       inputId = "myconfirmation",
##D       type = "warning",
##D       title = "Want to confirm ?",
##D       danger_mode = TRUE
##D     )
##D   })
##D 
##D   # raw output
##D   output$res <- renderPrint(input$myconfirmation)
##D 
##D   # count click
##D   true <- reactiveVal(0)
##D   false <- reactiveVal(0)
##D   observeEvent(input$myconfirmation, {
##D     if (isTRUE(input$myconfirmation)) {
##D       x <- true() + 1
##D       true(x)
##D     } else {
##D       x <- false() + 1
##D       false(x)
##D     }
##D   }, ignoreNULL = TRUE)
##D   output$count <- renderUI({
##D     tags$span(
##D       "Confirm:", tags$b(true()),
##D       tags$br(),
##D       "Cancel:", tags$b(false())
##D     )
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D 
##D 
##D # other options :
##D 
##D ui <- fluidPage(
##D   tags$h1("Confirm sweet alert"),
##D   actionButton(
##D     inputId = "launch1",
##D     label = "Launch confirmation dialog (with danger mode)"
##D   ),
##D   verbatimTextOutput(outputId = "res1"),
##D   tags$br(),
##D   actionButton(
##D     inputId = "launch2",
##D     label = "Launch confirmation dialog (with normal mode)"
##D   ),
##D   verbatimTextOutput(outputId = "res2"),
##D   tags$br(),
##D   actionButton(
##D     inputId = "launch3",
##D     label = "Launch confirmation dialog (with HTML)"
##D   ),
##D   verbatimTextOutput(outputId = "res3")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   observeEvent(input$launch1, {
##D     confirmSweetAlert(
##D       session = session,
##D       inputId = "myconfirmation1",
##D       type = "warning",
##D       title = "Want to confirm ?",
##D       danger_mode = TRUE
##D     )
##D   })
##D   output$res1 <- renderPrint(input$myconfirmation1)
##D 
##D   observeEvent(input$launch2, {
##D     confirmSweetAlert(
##D       session = session,
##D       inputId = "myconfirmation2",
##D       type = "warning",
##D       title = "Are you sure ??",
##D       btn_labels = c("Nope", "Yep"),
##D       danger_mode = FALSE
##D     )
##D   })
##D   output$res2 <- renderPrint(input$myconfirmation2)
##D 
##D   observeEvent(input$launch3, {
##D     confirmSweetAlert(
##D       session = session,
##D       inputId = "myconfirmation3",
##D       title = NULL,
##D       text = tags$b(
##D         icon("file"),
##D         "Do you really want to delete this file ?",
##D         style = "color: #FA5858;"
##D       ),
##D       btn_labels = c("Cancel", "Delete file"),
##D       danger_mode = TRUE, html = TRUE
##D     )
##D   })
##D   output$res3 <- renderPrint(input$myconfirmation3)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



