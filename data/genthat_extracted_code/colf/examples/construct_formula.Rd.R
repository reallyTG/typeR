library(colf)


### Name: construct_formula
### Title: Construct an nls-compatible formula from an lm style formula
### Aliases: construct_formula

### ** Examples

#simple syntax
construct_formula(mpg ~ hp + cyl, mtcars)

#example of make.names to create syntactically valid names
make.names('(foo/^@bar)')

#function will create syntactically valid names (if applicable) 
#otherwise the optimizers will fail
construct_formula(mpg ~ I(hp + cyl), mtcars)
construct_formula(mpg ~ (hp + cyl + disp)^3, mtcars)




