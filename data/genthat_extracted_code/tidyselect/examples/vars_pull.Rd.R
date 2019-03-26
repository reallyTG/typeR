library(tidyselect)


### Name: vars_pull
### Title: Select variable
### Aliases: vars_pull
### Keywords: internal

### ** Examples

# It takes its argument by expression:
vars_pull(letters, c)

# Negative numbers select from the end:
vars_pull(letters, -3)

# You can unquote variables:
var <- 10
vars_pull(letters, !! var)



