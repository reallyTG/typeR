library(rccmisc)


### Name: findvar
### Title: Find variables by name
### Aliases: findvar findvar_anywhere findvar_fun findvar_in_df

### ** Examples

find_cars <- findvar_fun(cars)
find_cars("sp")

findvar_in_df("sp", cars)

cars <- cars; iris <- iris
findvar_anywhere("petal")



