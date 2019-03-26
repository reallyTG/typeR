library(calendar)


### Name: ic_bind_list
### Title: Bind list of named vectors of variable length into data frame
### Aliases: ic_bind_list

### ** Examples

ic_bind_list(list(ic_vector(ical_example)))
ics_file <- system.file("extdata", "england-and-wales.ics", package = "ical")
ics_raw = readLines(ics_file)
x <- lapply(ic_list(ics_raw), function(x) {
  ic_vector(x)
})
ic_df <- ic_bind_list(x)
head(ic_df)
x <- lapply(ical_outlook, function(x) {
  ic_vector(x)
})
ic_bind_list(x)



