library(janitor)


### Name: untabyl
### Title: Remove 'tabyl' attributes from a data.frame.
### Aliases: untabyl

### ** Examples


mtcars %>%
  tabyl(am) %>%
  untabyl() %>%
  attributes() # tabyl-specific attributes are gone



