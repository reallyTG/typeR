library(janitor)


### Name: excel_numeric_to_date
### Title: Convert dates encoded as serial numbers to Date class.
### Aliases: excel_numeric_to_date

### ** Examples

excel_numeric_to_date(40000)
excel_numeric_to_date(40000.5) # No time is included
excel_numeric_to_date(40000.5, include_time = TRUE) # Time is included
excel_numeric_to_date(40000.521, include_time = TRUE) # Time is included
excel_numeric_to_date(40000.521, include_time = TRUE,
  round_seconds = FALSE) # Time with fractional seconds is included



