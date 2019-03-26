library(tfse)


### Name: cc
### Title: Combine comma separated strings
### Aliases: cc

### ** Examples


## comma separated alphabet
abcs <- paste(letters, collapse = ",")

## split single string
cc(abcs)

## return as list
cc(abcs, simplify = FALSE)

## select columns
mtcars[, cc("cyl,mpg,wt,gear")]

## character vector with multiple strings
x <- c("v1,v2,v3", "y1,y2,y5")

## convert strings into list of [split] character vectors
cc(x)




