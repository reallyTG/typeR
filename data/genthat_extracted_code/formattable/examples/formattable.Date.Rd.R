library(formattable)


### Name: formattable.Date
### Title: Create a formattable Date vector
### Aliases: formattable.Date

### ** Examples

dates <- as.Date("2015-04-10") + 1:5
fdates <- formattable(dates, format = "%m/%d/%Y")
fdates
fdates + 30



