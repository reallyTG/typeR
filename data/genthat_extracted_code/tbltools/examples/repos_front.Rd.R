library(tbltools)


### Name: repos_front
### Title: move vars to front
### Aliases: repos_front

### ** Examples

## data with row names
d <- data.frame(x = rnorm(5), y = rnorm(5), row.names = letters[1:5])

## move y to front
repos_front(d, y)




