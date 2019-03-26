library(wrapr)


### Name: mk_formula
### Title: Construct a formula.
### Aliases: mk_formula

### ** Examples


f <- mk_formula("mpg", c("cyl", "disp"))
print(f)
lm(f, mtcars)




