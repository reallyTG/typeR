library(shinyWidgets)


### Name: updateSwitchInput
### Title: Change the value of a switch input on the client
### Aliases: updateSwitchInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D   library("shiny")
##D   library("shinyWidgets")
##D 
##D 
##D   ui <- fluidPage(
##D     tags$h1("Update", tags$code("switchInput")),
##D     br(),
##D     fluidRow(
##D       column(
##D         width = 4,
##D         panel(
##D           switchInput(inputId = "switch1"),
##D           verbatimTextOutput(outputId = "resup1"),
##D           tags$div(
##D             class = "btn-group",
##D             actionButton(
##D               inputId = "updatevaluetrue",
##D               label = "Set to TRUE"
##D             ),
##D             actionButton(
##D               inputId = "updatevaluefalse",
##D               label = "Set to FALSE"
##D             )
##D           ),
##D           heading = "Update value"
##D         )
##D       ),
##D 
##D       column(
##D         width = 4,
##D         panel(
##D           switchInput(inputId = "switch2",
##D                       label = "My label"),
##D           verbatimTextOutput(outputId = "resup2"),
##D           textInput(inputId = "updatelabeltext",
##D                     label = "Update label:"),
##D           heading = "Update label"
##D         )
##D       ),
##D 
##D       column(
##D         width = 4,
##D         panel(
##D           switchInput(
##D             inputId = "switch3",
##D             onLabel = "Yeaah",
##D             offLabel = "Noooo"
##D           ),
##D           verbatimTextOutput(outputId = "resup3"),
##D           fluidRow(column(
##D             width = 6,
##D             textInput(inputId = "updateonLabel",
##D                       label = "Update onLabel:")
##D           ),
##D           column(
##D             width = 6,
##D             textInput(inputId = "updateoffLabel",
##D                       label = "Update offLabel:")
##D           )),
##D           heading = "Update onLabel & offLabel"
##D         )
##D       )
##D     ),
##D 
##D     fluidRow(column(
##D       width = 4,
##D       panel(
##D         switchInput(inputId = "switch4"),
##D         verbatimTextOutput(outputId = "resup4"),
##D         fluidRow(
##D           column(
##D             width = 6,
##D             pickerInput(
##D               inputId = "updateonStatus",
##D               label = "Update onStatus:",
##D               choices = c("default", "primary", "success",
##D                           "info", "warning", "danger")
##D             )
##D           ),
##D           column(
##D             width = 6,
##D             pickerInput(
##D               inputId = "updateoffStatus",
##D               label = "Update offStatus:",
##D               choices = c("default", "primary", "success",
##D                           "info", "warning", "danger")
##D             )
##D           )
##D         ),
##D         heading = "Update onStatus & offStatusr"
##D       )
##D     ),
##D 
##D     column(
##D       width = 4,
##D       panel(
##D         switchInput(inputId = "switch5"),
##D         verbatimTextOutput(outputId = "resup5"),
##D         checkboxInput(
##D           inputId = "disabled",
##D           label = "Disabled",
##D           value = FALSE
##D         ),
##D         heading = "Disabled"
##D       )
##D     ))
##D 
##D   )
##D 
##D   server <- function(input, output, session) {
##D     # Update value
##D     observeEvent(input$updatevaluetrue, {
##D       updateSwitchInput(session = session,
##D                         inputId = "switch1",
##D                         value = TRUE)
##D     })
##D     observeEvent(input$updatevaluefalse, {
##D       updateSwitchInput(session = session,
##D                         inputId = "switch1",
##D                         value = FALSE)
##D     })
##D     output$resup1 <- renderPrint({
##D       input$switch1
##D     })
##D 
##D 
##D     # Update label
##D     observeEvent(input$updatelabeltext, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch2",
##D         label = input$updatelabeltext
##D       )
##D     }, ignoreInit = TRUE)
##D     output$resup2 <- renderPrint({
##D       input$switch2
##D     })
##D 
##D 
##D     # Update onLabel & offLabel
##D     observeEvent(input$updateonLabel, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch3",
##D         onLabel = input$updateonLabel
##D       )
##D     }, ignoreInit = TRUE)
##D     observeEvent(input$updateoffLabel, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch3",
##D         offLabel = input$updateoffLabel
##D       )
##D     }, ignoreInit = TRUE)
##D     output$resup3 <- renderPrint({
##D       input$switch3
##D     })
##D 
##D 
##D     # Update onStatus & offStatus
##D     observeEvent(input$updateonStatus, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch4",
##D         onStatus = input$updateonStatus
##D       )
##D     }, ignoreInit = TRUE)
##D     observeEvent(input$updateoffStatus, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch4",
##D         offStatus = input$updateoffStatus
##D       )
##D     }, ignoreInit = TRUE)
##D     output$resup4 <- renderPrint({
##D       input$switch4
##D     })
##D 
##D 
##D     # Disabled
##D     observeEvent(input$disabled, {
##D       updateSwitchInput(
##D         session = session,
##D         inputId = "switch5",
##D         disabled = input$disabled
##D       )
##D     }, ignoreInit = TRUE)
##D     output$resup5 <- renderPrint({
##D       input$switch5
##D     })
##D 
##D   }
##D 
##D   shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



