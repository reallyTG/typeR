library(condformat)


### Name: theme_kable
### Title: Customizes appearance of condformat object
### Aliases: theme_kable

### ** Examples

data(iris)
condformat(head(iris)) %>%
  theme_kable(booktabs = TRUE, caption = "My Caption")



