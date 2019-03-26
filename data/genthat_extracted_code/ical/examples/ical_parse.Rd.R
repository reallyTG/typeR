library(ical)


### Name: ical_parse
### Title: ical_parse
### Aliases: ical_parse ical_parse_df ical_parse_list

### ** Examples


# parse from character vector
char_vec <- readLines(system.file("birthdays.ics", package = "ical"))
ical_parse(text = char_vec)

# parse from file
ical_parse(file = system.file("birthdays.ics", package = "ical"))




