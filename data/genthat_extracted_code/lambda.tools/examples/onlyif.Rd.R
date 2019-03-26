library(lambda.tools)


### Name: onlyif
### Title: Conditionally apply a function to an argument
### Aliases: onlyif

### ** Examples

x <- 1:5
onlyif(length(x) < 10, pad(x, 10 - length(x)), x)
onlyif(length(x) < 10, function(x) pad(x, 10 - length(x)), x)

# This returns x
x <- 1:20
onlyif(length(x) < 10, function(x) pad(x, 10 - length(x)), x)



