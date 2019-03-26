library(zoo)


### Name: make.par.list
### Title: Make a List from a Parameter Specification
### Aliases: make.par.list
### Keywords: ts

### ** Examples

make.par.list(letters[1:5], 1:5, 3, 5)
suppressWarnings( make.par.list(letters[1:5], 1:4, 3, 5, 99) )
make.par.list(letters[1:5], c(d=3), 3, 5, 99)
make.par.list(letters[1:5], list(d=1:2, 99), 3, 5)
make.par.list(letters[1:5], list(d=1:2, 99, 100), 3, 5)



