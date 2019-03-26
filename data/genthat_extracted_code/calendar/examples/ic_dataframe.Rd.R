library(calendar)


### Name: ic_dataframe
### Title: Convert iCal lines of text into a data frame
### Aliases: ic_dataframe

### ** Examples

ic_dataframe(ical_example)
ic_dataframe(ical_outlook)
ics_file <- system.file("extdata", "england-and-wales.ics", package = "calendar")
x = readLines(ics_file)
x_df = ic_dataframe(x)
head(x_df)
x = data.frame(x_df)
x_df2 = ic_dataframe(x)
identical(x, x_df2)



