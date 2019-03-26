library(mosaicModel)


### Name: mod_fun
### Title: Transforms a model into a function of inputs -> output
### Aliases: mod_fun

### ** Examples

my_mod <- lm(mpg ~ hp * cyl, data = mtcars)
f <- mod_fun(my_mod)
names(formals(f)) # the arguments will be the explanatory variables
f(hp = 1:2)
f(hp = 1:2, cyl = 3:4)
f() # typical values for inputs



