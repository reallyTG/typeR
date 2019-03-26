library(auk)


### Name: auk_last_edited
### Title: Filter the eBird data by last edited date
### Aliases: auk_last_edited

### ** Examples

system.file("extdata/ebd-sample.txt", package = "auk") %>%
  auk_ebd() %>%
  auk_last_edited(date = c("2010-01-01", "2010-12-31"))



