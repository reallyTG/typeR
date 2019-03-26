library(tbltools)


### Name: repos_back
### Title: move vars to back
### Aliases: repos_back

### ** Examples

## data with row names
d <- data.frame(x = rnorm(5), y = rnorm(5), row.names = letters[1:5])

## move x to back
repos_back(d, x)




