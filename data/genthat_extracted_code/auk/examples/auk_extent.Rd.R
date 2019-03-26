library(auk)


### Name: auk_extent
### Title: Filter the eBird data by spatial extent
### Aliases: auk_extent

### ** Examples

# fliter to locations roughly in the Pacific Northwest
system.file("extdata/ebd-sample.txt", package = "auk") %>%
  auk_ebd() %>%
  auk_bbox(bbox = c(-125, 37, -120, 52))
  
# alternatively, without pipes
ebd <- auk_ebd(system.file("extdata/ebd-sample.txt", package = "auk"))
auk_bbox(ebd, bbox = c(-125, 37, -120, 52))



