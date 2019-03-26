library(shinybootstrap2)


### Name: dateRangeInput
### Title: Create date range input
### Aliases: dateRangeInput

### ** Examples

dateRangeInput("daterange", "Date range:",
               start = "2001-01-01",
               end   = "2010-12-31")

# Default start and end is the current date in the client's time zone
dateRangeInput("daterange", "Date range:")

# start and end are always specified in yyyy-mm-dd, even if the display
# format is different
dateRangeInput("daterange", "Date range:",
               start  = "2001-01-01",
               end    = "2010-12-31",
               min    = "2001-01-01",
               max    = "2012-12-21",
               format = "mm/dd/yy",
               separator = " - ")

# Pass in Date objects
dateRangeInput("daterange", "Date range:",
               start = Sys.Date()-10,
               end = Sys.Date()+10)

# Use different language and different first day of week
dateRangeInput("daterange", "Date range:",
               language = "de",
               weekstart = 1)

# Start with decade view instead of default month view
dateRangeInput("daterange", "Date range:",
               startview = "decade")



