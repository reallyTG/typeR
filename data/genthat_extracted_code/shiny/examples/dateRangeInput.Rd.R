library(shiny)


### Name: dateRangeInput
### Title: Create date range input
### Aliases: dateRangeInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  dateRangeInput("daterange1", "Date range:",
                 start = "2001-01-01",
                 end   = "2010-12-31"),

  # Default start and end is the current date in the client's time zone
  dateRangeInput("daterange2", "Date range:"),

  # start and end are always specified in yyyy-mm-dd, even if the display
  # format is different
  dateRangeInput("daterange3", "Date range:",
                 start  = "2001-01-01",
                 end    = "2010-12-31",
                 min    = "2001-01-01",
                 max    = "2012-12-21",
                 format = "mm/dd/yy",
                 separator = " - "),

  # Pass in Date objects
  dateRangeInput("daterange4", "Date range:",
                 start = Sys.Date()-10,
                 end = Sys.Date()+10),

  # Use different language and different first day of week
  dateRangeInput("daterange5", "Date range:",
                 language = "de",
                 weekstart = 1),

  # Start with decade view instead of default month view
  dateRangeInput("daterange6", "Date range:",
                 startview = "decade")
)

shinyApp(ui, server = function(input, output) { })
}



