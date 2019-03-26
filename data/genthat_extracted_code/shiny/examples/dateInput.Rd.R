library(shiny)


### Name: dateInput
### Title: Create date input
### Aliases: dateInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  dateInput("date1", "Date:", value = "2012-02-29"),

  # Default value is the date in client's time zone
  dateInput("date2", "Date:"),

  # value is always yyyy-mm-dd, even if the display format is different
  dateInput("date3", "Date:", value = "2012-02-29", format = "mm/dd/yy"),

  # Pass in a Date object
  dateInput("date4", "Date:", value = Sys.Date()-10),

  # Use different language and different first day of week
  dateInput("date5", "Date:",
          language = "ru",
          weekstart = 1),

  # Start with decade view instead of default month view
  dateInput("date6", "Date:",
            startview = "decade")
)

shinyApp(ui, server = function(input, output) { })
}



