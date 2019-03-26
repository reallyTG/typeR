library(NLP)


### Name: datetime
### Title: Parse ISO 8601 Date/Time Strings
### Aliases: parse_ISO_8601_datetime

### ** Examples

## Use the examples from <https://www.w3.org/TR/NOTE-datetime>, plus one
## in UTC.
x <- c("1997",
       "1997-07",
       "1997-07-16",
       "1997-07-16T19:20+01:00",
       "1997-07-16T19:20:30+01:00",
       "1997-07-16T19:20:30.45+01:00",
       "1997-07-16T19:20:30.45Z")
y <- parse_ISO_8601_datetime(x)
y
## Conversions: note that "incomplete" elements are converted to
## "missing".
as.Date(y)
as.POSIXlt(y)
## Subscripting and extracting components:
head(y, 3)
y$mon



