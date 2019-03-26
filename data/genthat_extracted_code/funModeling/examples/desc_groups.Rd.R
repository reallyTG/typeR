library(funModeling)


### Name: desc_groups
### Title: Profiling categorical variable
### Aliases: desc_groups

### ** Examples

# default grouping function: mean
desc_groups(data=mtcars, group_var="cyl")

# using the median as the grouping function
desc_groups(data=mtcars, group_var="cyl", group_func=median)

# using the max as the grouping function
desc_groups(data=mtcars, group_var="gear", group_func=max)



