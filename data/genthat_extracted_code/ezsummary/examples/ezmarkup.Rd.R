library(ezsummary)


### Name: ezmarkup
### Title: Easy way to "markup" a table before it is sent to be displayed
### Aliases: ezmarkup

### ** Examples

library(dplyr)
dt <- mtcars %>% group_by(cyl) %>% select(gear, carb) %>% ezsummary_categorical(n=TRUE)

ezmarkup(dt, "...[.(.)]")
ezmarkup(dt, "..[. (. ~ .)]")




