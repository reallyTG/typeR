library(rpsychi)


### Name: formatted
### Title: Convert a numeric vector into a character vector with the
###   specified number of decimal place
### Aliases: formatted
### Keywords: univar

### ** Examples

data(infert)
x <- svar(infert$age)    #sample variance
formatted(x)
formatted(x, digits=4)



