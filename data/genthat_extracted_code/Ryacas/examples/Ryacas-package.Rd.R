library(Ryacas)


### Name: Ryacas-package
### Title: R interface to yacas computer algebra package
### Aliases: Ryacas-package
### Keywords: programming

### ** Examples

print(yacas(expression(integrate(1/x, x))))
print(yacas("Integrate(x)1/x"))
x <- Sym("x"); Integrate(1/x, x)
acos(Sym("1/2"))



