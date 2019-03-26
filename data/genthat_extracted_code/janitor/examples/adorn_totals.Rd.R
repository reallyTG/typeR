library(janitor)


### Name: adorn_totals
### Title: Append a totals row and/or column to a data.frame.
### Aliases: adorn_totals

### ** Examples

mtcars %>%
  tabyl(am, cyl) %>%
  adorn_totals()



