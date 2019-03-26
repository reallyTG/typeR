library(auk)


### Name: auk_complete
### Title: Filter out incomplete checklists from the eBird data
### Aliases: auk_complete

### ** Examples

system.file("extdata/ebd-sample.txt", package = "auk") %>%
  auk_ebd() %>%
  auk_complete()



