library(GROAN)


### Name: is.single.slot
### Title: Is a single slot thing?
### Aliases: is.single.slot
### Keywords: internal

### ** Examples

is.single.slot(5)   #TRUE
is.single.slot('foobar')   #TRUE
is.single.slot(NULL)       #depends on NULL.is.single
is.single.slot(NA)         #TRUE
is.single.slot(c(1,2,5))   #FALSE
is.single.slot(matrix(0, 10, 5))   #FALSE
is.single.slot(matrix(0, 1, 1))   #TRUE



