library(funModeling)


### Name: desc_groups_rank
### Title: Profiling categorical variable (rank)
### Aliases: desc_groups_rank

### ** Examples

# default grouping function: mean
desc_groups_rank(data=mtcars, group_var="gear")

# using the median as the grouping function
desc_groups(data=mtcars, group_var="cyl", group_func=median)

# using the max as the grouping function
desc_groups_rank(data=mtcars, group_var="gear", group_func=max)



