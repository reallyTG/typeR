library(calendar)


### Name: ic_write
### Title: Write ics file
### Aliases: ic_write

### ** Examples

ic <- ical(ical_example)
ic_write(ic, file.path(tempdir(), "ic.ics"))
f <- system.file("extdata", "example.ics", package = "calendar")
identical(readLines(file.path(tempdir(), "ic.ics")), readLines(f))
f <- system.file("extdata", "england-and-wales.ics", package = "calendar")
ics_df <- ic_read(f)
ic_write(ics_df, file.path(tempdir(), "ic.ics"))
# test similarity between files with diff tool like meld - from shell:
# meld ic.ics inst/extdata/england-and-wales.ics



