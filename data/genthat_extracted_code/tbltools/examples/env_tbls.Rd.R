library(tbltools)


### Name: env_tbls
### Title: Convert all data frames in environment into tibbles
### Aliases: env_tbls

### ** Examples

## data with row names
d <- data.frame(x = rnorm(5), y = rnorm(5), row.names = letters[1:5])

## convert data frames in global environment to tibbles
env_tbls()




