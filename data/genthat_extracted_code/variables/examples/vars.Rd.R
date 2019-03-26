library(variables)


### Name: vars
### Title: Multiple Abstract Descriptions
### Aliases: as.vars c.var

### ** Examples


   f <- factor_var("x", levels = LETTERS[1:3])
   n <- numeric_var("y")

   fn <- c(f, n)
   variable.names(fn)
   support(fn)
   is.bounded(fn)
   mkgrid(fn, n = 9)

   as.vars(iris)



