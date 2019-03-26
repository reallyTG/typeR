library(condformat)


### Name: theme_htmlWidget
### Title: Customizes appearance of condformat object
### Aliases: theme_htmlWidget

### ** Examples

data(iris)
condformat(head(iris)) %>%
  theme_htmlWidget(number_of_entries = c(10, 25, 100),
                   width = NULL, height = NULL, elementId = NULL)



