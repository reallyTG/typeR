library(shinyWidgets)


### Name: pickerInput
### Title: Select picker Input Control
### Aliases: pickerInput

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D # You can run the gallery to see other examples
##D shinyWidgetsGallery()
##D 
##D 
##D # Simple example
##D library("shiny")
##D ui <- fluidPage(
##D   pickerInput(inputId = "somevalue", label = "A label", choices = c("a", "b")),
##D   verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderPrint({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D 
##D 
##D ### Add actions box for selecting
##D # deselecting all options
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   br(),
##D   pickerInput(
##D     inputId = "p1",
##D     label = "Select all option",
##D     choices = rownames(mtcars),
##D     multiple = TRUE,
##D     options = list(`actions-box` = TRUE)
##D   ),
##D   br(),
##D   pickerInput(
##D     inputId = "p2",
##D     label = "Select all option / custom text",
##D     choices = rownames(mtcars),
##D     multiple = TRUE,
##D     options = list(
##D       `actions-box` = TRUE,
##D       `deselect-all-text` = "None...",
##D       `select-all-text` = "Yeah, all !",
##D       `none-selected-text` = "zero"
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D 
##D 
##D ### Customize the values displayed in the box ----
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   br(),
##D   pickerInput(
##D     inputId = "p1",
##D     label = "Default",
##D     multiple = TRUE,
##D     choices = rownames(mtcars),
##D     selected = rownames(mtcars)[1:5]
##D   ),
##D   br(),
##D   pickerInput(
##D     inputId = "p1b",
##D     label = "Default with | separator",
##D     multiple = TRUE,
##D     choices = rownames(mtcars),
##D     selected = rownames(mtcars)[1:5],
##D     options = list(`multiple-separator` = " | ")
##D   ),
##D   br(),
##D   pickerInput(
##D     inputId = "p2",
##D     label = "Static",
##D     multiple = TRUE,
##D     choices = rownames(mtcars),
##D     selected = rownames(mtcars)[1:5],
##D     options = list(`selected-text-format`= "static",
##D                    title = "Won't change")
##D   ),
##D   br(),
##D   pickerInput(
##D     inputId = "p3",
##D     label = "Count",
##D     multiple = TRUE,
##D     choices = rownames(mtcars),
##D     selected = rownames(mtcars)[1:5],
##D     options = list(`selected-text-format`= "count")
##D   ),
##D   br(),
##D   pickerInput(
##D     inputId = "p3",
##D     label = "Customize count",
##D     multiple = TRUE,
##D     choices = rownames(mtcars),
##D     selected = rownames(mtcars)[1:5],
##D     options = list(
##D       `selected-text-format`= "count",
##D       `count-selected-text` = "{0} models choosed (on a total of {1})"
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D 
##D 
##D ### Limit the number of selections ----
##D 
##D library(shiny)
##D library(shinyWidgets)
##D ui <- fluidPage(
##D   pickerInput(
##D     inputId = "groups",
##D     label = "Select one from each group below:",
##D     choices = list(
##D       Group1 = c("1", "2", "3", "4"),
##D       Group2 = c("A", "B", "C", "D")
##D     ),
##D     multiple = TRUE,
##D     options =  list("max-options-group" = 1)
##D   ),
##D   verbatimTextOutput(outputId = "res_grp"),
##D   pickerInput(
##D     inputId = "groups_2",
##D     label = "Select two from each group below:",
##D     choices = list(
##D       Group1 = c("1", "2", "3", "4"),
##D       Group2 = c("A", "B", "C", "D")
##D     ),
##D     multiple = TRUE,
##D     options =  list("max-options-group" = 2)
##D   ),
##D   verbatimTextOutput(outputId = "res_grp_2"),
##D   pickerInput(
##D     inputId = "classic",
##D     label = "Select max two option below:",
##D     choices = c("A", "B", "C", "D"),
##D     multiple = TRUE,
##D     options =  list(
##D       "max-options" = 2,
##D       "max-options-text" = "No more!"
##D     )
##D   ),
##D   verbatimTextOutput(outputId = "res_classic")
##D )
##D server <- function(input, output) {
##D   output$res_grp <- renderPrint(input$groups)
##D   output$res_grp_2 <- renderPrint(input$groups_2)
##D   output$res_classic <- renderPrint(input$classic)
##D }
##D shinyApp(ui, server)
##D 
##D }
## End(Not run)




