library(calendar)


### Name: ical_example
### Title: Minimal example of raw ical data
### Aliases: ical_example
### Keywords: datasets

### ** Examples

# download.file("long_url", "inst/extdata/example.ics")
ical_example = readLines(system.file("extdata", "example.ics", package = "ical"))
# usethis::use_data(ical_example)



