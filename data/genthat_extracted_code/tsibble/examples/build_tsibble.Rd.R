library(tsibble)


### Name: build_tsibble
### Title: Low-level constructor for a tsibble object
### Aliases: build_tsibble

### ** Examples

# Prepare `pedestrian` to use a new index `Date` ----
pedestrian %>%
  build_tsibble(
    key = key(.), index = !! index(.), index2 = Date, interval = interval(.)
  )



