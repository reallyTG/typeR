library(qdapRegex)


### Name: rm_date
### Title: Remove/Replace/Extract Dates
### Aliases: rm_date ex_date
### Keywords: date

### ** Examples

## Numeric Date Representation
x <- paste0("Format dates as 04/12/2014, 04-12-2014, 04.12.2014. or",
    " 04/12/14 but leaves mismatched: 12.12/2014")
rm_date(x)
ex_date(x)

## Word/Abbreviation Date Representation
x2 <- paste0("Format dates as Sept 09, 2002 or October 22, 1887",
  "but not 04-12-2014 and may match good 00, 9999")
rm_date(x2, pattern="@rm_date2")
ex_date(x2, pattern="@rm_date2")


## Year-Month-Day Representation
x3 <- sprintf("R uses time in this format %s.", Sys.time())
rm_date(x3, pattern="@rm_date3")

## Grab all types
ex_date(c(x, x2, x3), pattern="@rm_date4")



