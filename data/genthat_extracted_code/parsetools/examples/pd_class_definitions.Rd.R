library(parsetools)


### Name: pd_class_definitions
### Title: Test for Class Definitions
### Aliases: pd_class_definitions pd_is_class_definition
###   pd_is_in_class_definition pd_add_class_definition pd_add_class
### Keywords: datasets

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

# Get the 'setClass' call.
class.id <- pd_get_assign_value_id(roots[2], pd)
# Check to make sure that it is a function that sets a class.
pd_is_class_definition(class.id, pd)
# and that it is the setClass call.
pd_text(pd_get_call_symbol_id(class.id, pd), pd)




