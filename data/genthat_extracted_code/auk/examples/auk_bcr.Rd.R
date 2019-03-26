library(auk)


### Name: auk_bcr
### Title: Filter the eBird data by Bird Conservation Region
### Aliases: auk_bcr

### ** Examples

# bcr codes can be looked up in bcr_codes
dplyr::filter(bcr_codes, bcr_name == "Central Hardwoods")
system.file("extdata/ebd-sample.txt", package = "auk") %>%
  auk_ebd() %>%
  auk_bcr(bcr = 24)
  
# alternatively, without pipes
ebd <- auk_ebd(system.file("extdata/ebd-sample.txt", package = "auk"))
auk_bcr(ebd, bcr = 24)



