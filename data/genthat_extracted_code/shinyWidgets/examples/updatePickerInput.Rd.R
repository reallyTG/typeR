library(shinyWidgets)


### Name: updatePickerInput
### Title: Change the value of a select picker input on the client
### Aliases: updatePickerInput

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   tags$h2("Update pickerInput"),
##D 
##D   fluidRow(
##D     column(
##D       width = 5, offset = 1,
##D       pickerInput(
##D         inputId = "p1",
##D         label = "classic update",
##D         choices = rownames(mtcars)
##D       )
##D     ),
##D     column(
##D       width = 5,
##D       pickerInput(
##D         inputId = "p2",
##D         label = "disabled update",
##D         choices = rownames(mtcars)
##D       )
##D     )
##D   ),
##D 
##D   fluidRow(
##D     column(
##D       width = 10, offset = 1,
##D       sliderInput(
##D         inputId = "up",
##D         label = "Select between models with mpg greater than :",
##D         width = "50%",
##D         min = min(mtcars$mpg),
##D         max = max(mtcars$mpg),
##D         value = min(mtcars$mpg),
##D         step = 0.1
##D       )
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   observeEvent(input$up, {
##D     mtcars2 <- mtcars[mtcars$mpg >= input$up, ]
##D 
##D     # Method 1
##D     updatePickerInput(session = session, inputId = "p1",
##D                       choices = rownames(mtcars2))
##D 
##D     # Method 2
##D     disabled_choices <- !rownames(mtcars) %in% rownames(mtcars2)
##D     updatePickerInput(
##D       session = session, inputId = "p2",
##D       choices = rownames(mtcars),
##D       choicesOpt = list(
##D         disabled = disabled_choices,
##D         style = ifelse(disabled_choices,
##D                        yes = "color: rgba(119, 119, 119, 0.5);",
##D                        no = "")
##D       )
##D     )
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



