library(tbltools)


### Name: tidyselector
### Title: tidyselector
### Aliases: tidyselector

### ** Examples

## data with row names
d <- data.frame(x = rnorm(5), y = rnorm(5), row.names = letters[1:5])

## select only x
tidyselector(d, x)




