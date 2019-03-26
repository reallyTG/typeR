library(shinybootstrap2)


### Name: dateInput
### Title: Create date input
### Aliases: dateInput

### ** Examples

dateInput("date", "Date:", value = "2012-02-29")

# Default value is the date in client's time zone
dateInput("date", "Date:")

# value is always yyyy-mm-dd, even if the display format is different
dateInput("date", "Date:", value = "2012-02-29", format = "mm/dd/yy")

# Pass in a Date object
dateInput("date", "Date:", value = Sys.Date()-10)

# Use different language and different first day of week
dateInput("date", "Date:",
          language = "de",
          weekstart = 1)

# Start with decade view instead of default month view
dateInput("date", "Date:",
          startview = "decade")



