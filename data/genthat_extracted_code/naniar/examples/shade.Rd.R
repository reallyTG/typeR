library(naniar)


### Name: shade
### Title: Create new levels of missing
### Aliases: shade

### ** Examples

df <- tibble::tribble(
  ~wind, ~temp,
  -99,    45,
  68,    NA,
  72,    25
  )

shade(df$wind)

shade(df$wind,
      inst_fail = -99)

shade(df$wind,
      inst_fail = 100)




