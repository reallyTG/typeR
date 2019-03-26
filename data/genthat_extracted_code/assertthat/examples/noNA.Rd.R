library(assertthat)


### Name: noNA
### Title: Does object contain any missing values?
### Aliases: noNA

### ** Examples

see_if(noNA("a"))
see_if(noNA(c(TRUE, NA)))
x <- sample(c(1:10, NA), 100, rep = TRUE)
see_if(noNA(x))



