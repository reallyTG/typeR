library(calendar)


### Name: ic_list
### Title: Convert raw ical text into a list of items
### Aliases: ic_list

### ** Examples

ic_list(ical_example)
ics_file <- system.file("extdata", "england-and-wales.ics", package = "ical")
x = readLines(ics_file)
ics_list = ic_list(x)
ics_list[1:2]
ic_list(x, include_pattern = TRUE)



