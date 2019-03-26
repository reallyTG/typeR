library(janitor)


### Name: adorn_ns
### Title: Add underlying Ns to a tabyl displaying percentages.
### Aliases: adorn_ns

### ** Examples


mtcars %>%
  tabyl(am, cyl) %>%
  adorn_percentages("col") %>%
  adorn_pct_formatting() %>%
  adorn_ns(position = "front")



