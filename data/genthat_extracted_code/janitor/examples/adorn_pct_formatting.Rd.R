library(janitor)


### Name: adorn_pct_formatting
### Title: Format a data.frame of decimals as percentages.
### Aliases: adorn_pct_formatting

### ** Examples


mtcars %>%
  tabyl(am, cyl) %>%
  adorn_percentages("col") %>%
  adorn_pct_formatting()



