library(datacheck)


### Name: is.properName
### Title: Tests if string is like a proper name with inital letter in
###   upper case
### Aliases: is.properName

### ** Examples

# Valid proper names

is_proper_name("John") == TRUE

is_proper_name("john") == FALSE

is_proper_name(123) == FALSE 



