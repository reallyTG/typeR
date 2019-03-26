library(dtables)


### Name: dvariable
### Title: Data.frame of Variables and Classes
### Aliases: dvariable

### ** Examples

# Describe all variables in iris2
dvariable(iris2)

# Describe one or more specific variables in iris2
dvariable(iris2, vars = "Species")

# Return variable and class data in list
dvariable(iris2, as.list = TRUE)



