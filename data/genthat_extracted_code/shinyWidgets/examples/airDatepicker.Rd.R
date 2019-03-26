library(shinyWidgets)


### Name: airDatepicker
### Title: Air Date Picker Input
### Aliases: airDatepicker airDatepickerInput timepickerOptions
###   airMonthpickerInput airYearpickerInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D # examples of different options to select dates:
##D demoAirDatepicker("datepicker")
##D 
##D # select month(s)
##D demoAirDatepicker("months")
##D 
##D # select year(s)
##D demoAirDatepicker("years")
##D 
##D # select date and time
##D demoAirDatepicker("timepicker")
##D 
##D # You can select multiple dates :
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   airDatepickerInput(
##D     inputId = "multiple",
##D     label = "Select multiple dates:",
##D     placeholder = "You can pick 5 dates",
##D     multiple = 5, clearButton = TRUE
##D   ),
##D   verbatimTextOutput("res")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$res <- renderPrint(input$multiple)
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)




