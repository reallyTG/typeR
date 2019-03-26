library(lplyr)


### Name: mutate_which
### Title: Add new variables or modify existing ones on a subset of the
###   data
### Aliases: mutate_which mutate_which_ transmute_which transmute_which_

### ** Examples

df <- mtcars[1:10,]

# Non-standard evaluation
mutate_which(df, gear==4, carb = 100)
transmute_which(df, gear==4, carb = 100)

# Standard evaluation
mutate_which_(df, ~ gear==4, carb = ~ 100)
transmute_which_(df, ~ gear==4, carb = ~ 100)




