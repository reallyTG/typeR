library(radiant.data)


### Name: mutate_ext
### Title: Add transformed variables to a data frame with the option to
###   include a custom variable name extension
### Aliases: mutate_ext

### ** Examples

mutate_ext(mtcars, funs(log), mpg, cyl, .ext = "_ln")
mutate_ext(mtcars, funs(log), .ext = "_ln")
mutate_ext(mtcars, funs(log))
mutate_ext(mtcars, funs(log), .ext = "_ln", .vars = vars(mpg, cyl))




