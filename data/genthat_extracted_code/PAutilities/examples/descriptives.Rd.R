library(PAutilities)


### Name: descriptives
### Title: Compute descriptive statistics for a variable in the metabolic
###   data set
### Aliases: descriptives

### ** Examples

data(ex_data, package = "PAutilities")
ex_data$group_var <- rep(
 c("One", "Two", "Three"),
 each = ceiling(nrow(ex_data)/3)
)[seq(nrow(ex_data))]
descriptives(ex_data, "Axis1", "group_var")




