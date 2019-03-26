library(lazysql)


### Name: in_condition
### Title: Create SQL string to select values included in a set of given
###   values
### Aliases: in_condition

### ** Examples

# SQL expressions
lazysql::in_condition("COL_1", 1:3)

lazysql::in_condition("COL_1", 1:3, "not")

lazysql::in_condition("COL_1", LETTERS[2:3])

lazysql::in_condition("COL_1", LETTERS[2:3], "not")




