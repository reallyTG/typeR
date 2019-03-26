library(dat)


### Name: as.function.formula
### Title: Coerce a formula into a function
### Aliases: as.function.formula

### ** Examples

as.function(~ .)(1)
as.function(x ~ x)(1)
as.function(f(x, y) ~ c(x, y))(1, 2)
as.function(numeric : x ~ x)(1) # check for class
as.function(numeric(1) : x ~ x)(1) # check for class + length



