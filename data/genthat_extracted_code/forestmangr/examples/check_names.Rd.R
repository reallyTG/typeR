library(forestmangr)


### Name: check_names
### Title: Check if character vector contains variable names
### Aliases: check_names

### ** Examples

library(forestmangr)

check_names(iris, "Species")
check_names(iris, "Species", boolean = FALSE )

check_names(iris, c("Especies", "Setal.Width") )
check_names(iris, c("Especies", "Setal.Width"), boolean = FALSE)




