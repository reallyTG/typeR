library(janitor)


### Name: adorn_percentages
### Title: Convert a data.frame of counts to percentages.
### Aliases: adorn_percentages

### ** Examples


mtcars %>%
  tabyl(am, cyl) %>%
  adorn_percentages("col")

# calculates correctly even with totals column and/or row:
mtcars %>%
  tabyl(am, cyl) %>%
  adorn_totals("row") %>%
  adorn_percentages()



