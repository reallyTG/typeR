library(stringi)


### Name: stri_datetime_format
### Title: Date and Time Formatting and Parsing
### Aliases: stri_datetime_format stri_datetime_parse

### ** Examples

stri_datetime_parse(c("2015-02-28", "2015-02-29"), "yyyy-MM-dd")
stri_datetime_parse(c("2015-02-28", "2015-02-29"), "yyyy-MM-dd", lenient=TRUE)
stri_datetime_parse("19 lipca 2015", "date_long", locale="pl_PL")
stri_datetime_format(stri_datetime_now(), "datetime_relative_medium")




