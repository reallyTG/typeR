library(dapr)


### Name: lap
### Title: lap: List apply functions
### Aliases: lap

### ** Examples


## return string list
lap(letters, ~ paste0(.x, "."))

## return list of columns
lap(mtcars[1:5, ], as.character)




