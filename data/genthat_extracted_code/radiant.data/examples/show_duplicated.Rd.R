library(radiant.data)


### Name: show_duplicated
### Title: Show all rows with duplicated values (not just the first or
###   last)
### Aliases: show_duplicated

### ** Examples

bind_rows(mtcars, mtcars[c(1,5,7),]) %>%
  show_duplicated(mpg, cyl)
bind_rows(mtcars, mtcars[c(1,5,7),]) %>%
  show_duplicated




