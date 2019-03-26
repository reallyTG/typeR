library(shinyTime)


### Name: timeInput
### Title: Create a time input
### Aliases: timeInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  # Default value is 00:00:00
  timeInput("time1", "Time:"),

  # Set to current time
  timeInput("time2", "Time:", value = Sys.time()),

  # Set to custom time
  timeInput("time3", "Time:", value = strptime("12:34:56", "%T")),

  # Use %H:%M format
  timeInput("time4", "Time:", seconds = FALSE)
)

shinyApp(ui, server = function(input, output) { })
}




