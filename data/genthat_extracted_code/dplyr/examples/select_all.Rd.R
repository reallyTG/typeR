library(dplyr)


### Name: select_all
### Title: Select and rename a selection of variables
### Aliases: select_all rename_all select_if rename_if select_at rename_at

### ** Examples


# Supply a renaming function:
select_all(mtcars, toupper)
select_all(mtcars, "toupper")
select_all(mtcars, list(~toupper(.)))

# Selection drops unselected variables:
is_whole <- function(x) all(floor(x) == x)
select_if(mtcars, is_whole, toupper)
select_at(mtcars, vars(-contains("ar"), starts_with("c")), toupper)

# But renaming retains them:
rename_if(mtcars, is_whole, toupper)
rename_at(mtcars, vars(-(1:3)), toupper)
rename_all(mtcars, toupper)

# The renaming function is optional for selection:
select_if(mtcars, is_whole)
select_at(mtcars, vars(-everything()))
select_all(mtcars)



