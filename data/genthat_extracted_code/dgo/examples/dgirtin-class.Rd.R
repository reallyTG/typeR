library(dgo)


### Name: dgirtin-class
### Title: A class for data ready to model
### Aliases: dgirtin-class dgirtin-class, get_item_n, get_item_names,
###   get_n, dgirtIn-method, print.dgirtIn, summary summary,dgirtIn-method
###   print print,dgirtIn-method get_item_names
###   get_item_names,dgirtIn-method get_item_names get_n
###   get_n,dgirtIn-method get_n get_item_n get_item_n,dgirtIn-method
###   get_item_n show,dgirtIn-method

### ** Examples

data(toy_dgirt_in)
get_item_names(toy_dgirt_in)
get_n(toy_dgirt_in)
get_n(toy_dgirt_in, by = "year")
get_n(toy_dgirt_in, by = "source")
get_item_n(toy_dgirt_in)
get_item_n(toy_dgirt_in, by = "year")
data(toy_dgirt_in)
get_item_names(toy_dgirt_in)
# respondent count
data(toy_dgirt_in)
get_n(toy_dgirt_in)

# respondent count by year
get_n(toy_dgirt_in, by = "year")

# respondent count by year and survey identifier
get_n(toy_dgirt_in, by = c("year", "source"))

data(toy_dgirt_in)
get_item_n(toy_dgirt_in)
get_item_n(toy_dgirt_in, by = "year")



