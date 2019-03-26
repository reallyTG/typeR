library(calendar)


### Name: ic_read
### Title: Read ics file
### Aliases: ic_read

### ** Examples

f <- system.file("extdata", "england-and-wales.ics", package = "calendar")
ics_df = ic_read(f)
head(ics_df)



