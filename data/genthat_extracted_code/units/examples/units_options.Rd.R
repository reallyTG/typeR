library(units)


### Name: units_options
### Title: set one or more units global options
### Aliases: units_options

### ** Examples

old = units_options(sep = c("~~~", "~"), group = c("", "")) # more space, parenthesis
old
## set back to defaults:
units_options(sep = c("~", "~"), group = c("[", "]"), negative_power = FALSE, parse = TRUE)
units_options("group")



