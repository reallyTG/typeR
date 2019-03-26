library(forestmangr)


### Name: round_df
### Title: Round all numeric variables of a data frame to a given digit
### Aliases: round_df

### ** Examples

library(forestmangr)

# Round all numeric variables
round_df(iris) 

# Round all numeric variables using the floor function
round_df(iris, rf="floor") 

# Do not run
# trying this with the the base function throws an error:

# round(iris)




