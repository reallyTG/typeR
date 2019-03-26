library(parsetools)


### Name: assignments
### Title: Assignment Node Navigation.
### Aliases: assignments pd_is_assignment pd_get_assign_value_id
###   pd_get_assign_variable_id

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

# The first should be an assignment
pd_is_assignment(roots[[1]], pd=pd)

# the variable/value of the assignment can be accessed by
variable.id <- pd_get_assign_variable_id(roots[[1]], pd)
value.id <- pd_get_assign_value_id(roots[[1]], pd)
# Note that these function will give the variable/value part
# for both LEFT_ASSIGN and RIGHT_ASSIGN operators, going by order
# of ids, or position in the data may not give the expected results.



