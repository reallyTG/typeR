library(dplyr)


### Name: group_by_all
### Title: Group by a selection of variables
### Aliases: group_by_all group_by_at group_by_if

### ** Examples

# Group a data frame by all variables:
group_by_all(mtcars)

# Group by variables selected with a predicate:
group_by_if(iris, is.factor)

# Group by variables selected by name:
group_by_at(mtcars, vars(vs, am))

# Like group_by(), the scoped variants have optional mutate
# semantics. This provide a shortcut for group_by() + mutate():
d <- tibble(x=c(1,1,2,2), y=c(1,2,1,2))
group_by_all(d, as.factor)
group_by_if(iris, is.factor, as.character)



